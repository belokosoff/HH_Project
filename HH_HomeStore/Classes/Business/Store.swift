// Created by Maxim Belokosov.
//

import Combine
import Foundation

final class Store<State> {
    // MARK: Lifecycle

    init(initial: State) {
        stateSubject = .init(initial)
    }

    // MARK: Internal

    var published: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }

    var state: State {
        get {
            lock.lock()
            defer { lock.unlock() }
            return stateSubject.value
        }
        set {
            lock.lock()
            defer { lock.unlock() }
            stateSubject.send(newValue)
        }
    }

    subscript<T>(key: WritableKeyPath<State, T>) -> T {
        get {
            state[keyPath: key]
        }
        set(newValue) {
            state[keyPath: key] = newValue
        }
    }

    subscript<T>(key: WritableKeyPath<State, T?>) -> T? {
        get {
            state[keyPath: key]
        }
        set(newValue) {
            state[keyPath: key] = newValue
        }
    }

    // MARK: Private

    private let lock = NSLock()

    private let stateSubject: CurrentValueSubject<State, Never>
}
