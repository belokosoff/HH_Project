// Created by Maxim Belokosov.
//

import Foundation

// MARK: - Lifetime

public enum Lifetime { case singleton, scoped, transient }

// MARK: - Registration

private struct Registration {
    let lifetime: Lifetime
    let factory: (Resolver) -> Any
}

// MARK: - Resolver

public protocol Resolver: AnyObject {
    func resolve<T>() -> T
}

// MARK: - DIContainer

public final class DIContainer: Resolver {
    // MARK: Lifecycle

    public init(parent: DIContainer? = nil) { self.parent = parent }

    // MARK: Public

    public func register<T>(
        _ type: T.Type,
        lifetime: Lifetime = .transient,
        factory: @escaping (Resolver) -> T
    ) {
        let key = ObjectIdentifier(type)
        lock.lock(); defer { lock.unlock() }
        registrations[key] = Registration(lifetime: lifetime, factory: { r in factory(r) })
        // Clear caches if re-registering (useful for tests/previews)
        singletons[key] = nil
        scoped[key] = nil
    }

    @discardableResult
    public func unregister(_ type: (some Any).Type) -> Bool {
        let key = ObjectIdentifier(type)
        lock.lock(); defer { lock.unlock() }
        let removed = registrations.removeValue(forKey: key) != nil
        singletons[key] = nil
        scoped[key] = nil
        return removed
    }

    public func resolve<T>() -> T {
        lock.lock(); defer { lock.unlock() }
        guard let value = getInstance(T.self) as? T else {
            fatalError("No registration for \(T.self)")
        }
        return value
    }

    public func makeChildScope() -> DIContainer { DIContainer(parent: self) }
    public func resetScope() { lock.lock(); scoped.removeAll(); lock.unlock() }

    // MARK: Private

    private var registrations: [ObjectIdentifier: Registration] = [:]
    private var singletons: [ObjectIdentifier: Any] = [:]
    private var scoped: [ObjectIdentifier: Any] = [:]
    private let parent: DIContainer?
    private let lock = NSRecursiveLock()

    private func getInstance(_ type: (some Any).Type) -> Any {
        let key = ObjectIdentifier(type)

        if let reg = registrations[key] {
            switch reg.lifetime {
            case .singleton:
                if let cached = singletons[key] {
                    return cached
                }
                let value = instantiate(reg, key: key)
                singletons[key] = value
                return value
            case .scoped:
                if let cached = scoped[key] {
                    return cached
                }
                let value = instantiate(reg, key: key)
                scoped[key] = value
                return value
            case .transient:
                return instantiate(reg, key: key)
            }
        }

        if let parent {
            return parent.getInstance(type)
        }
        fatalError("No registration for \(type)")
    }

    /// Simple cycle guard via thread-local stack
    private func instantiate(_ reg: Registration, key: ObjectIdentifier) -> Any {
        let dict = Thread.current.threadDictionary
        let stackKey = "di.resolution.stack" as NSString
        var stack = dict[stackKey] as? [ObjectIdentifier] ?? []
        precondition(!stack.contains(key), "Cyclic dependency detected: \(stack) -> \(key)")
        stack.append(key)
        dict[stackKey] = stack
        let value = reg.factory(self)
        stack.removeLast()
        dict[stackKey] = stack
        return value
    }
}

// MARK: - AppComposition

@MainActor
final class AppComposition: ObservableObject {
    // MARK: Lifecycle

    init() {
        container.register(AuthViewModel.self, lifetime: .scoped) { _ in
            AuthViewModel()
        }

        container.register(OrdersViewModel.self, lifetime: .singleton) { _ in
            OrdersViewModel()
        }

        container.register(ProductsViewModel.self, lifetime: .scoped) { _ in
            ProductsViewModel()
        }

        container.register(ProfileViewModel.self, lifetime: .scoped) { _ in
            ProfileViewModel()
        }
    }

    // MARK: Internal

    let container = DIContainer()

    func makeSessionScope() -> DIContainer { container.makeChildScope() }
}
