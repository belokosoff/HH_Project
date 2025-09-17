// Created by Maxim Belokosov.
//

import Foundation

struct AppState: Codable {
    struct Persistance {
        // MARK: Internal

        func read() -> AppState {
            let isAuthorized = UserDefaults.standard.bool(forKey: Self.sessionKey)
            return AppState(isAuthorized: isAuthorized)
        }

        mutating func write(_ appState: AppState) {
            UserDefaults.standard.set(appState.isAuthorized, forKey: Self.sessionKey)
            UserDefaults.standard.synchronize()
        }

        // MARK: Private

        private static let sessionKey = "HH_HomeStore"
    }

    var isAuthorized: Bool = false
}
