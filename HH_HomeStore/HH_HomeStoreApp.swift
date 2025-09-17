// Created by Maxim Belokosov.
//

// HH_HomeStoreApp.swift
import Combine
import Factory
import SwiftUI

// MARK: - HH_HomeStoreApp

@main
struct HH_HomeStoreApp: App {
    @State private var currentRoute: RouteAuth = .login
    private var cancellable: AnyCancellable?

    var body: some Scene {
        WindowGroup {
            ZStack {
                switch currentRoute {
                case .login:
                    NavigationStack {
                        AuthScreenView()
                    }
                case .main:
                    NavigationStack {
                        ContentView()
                    }
                }
            }
            .onReceive(appState.published.receive(on: DispatchQueue.main)) { state in
                currentRoute = state.isAuthorized ? .main : .login
            }
        }
    }

    @Injected(\.appState) var appState
}

// MARK: - RouteAuth

enum RouteAuth: Hashable {
    case login
    case main
}
