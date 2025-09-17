// Created by Maxim Belokosov.
//

import Combine
import Factory
import Foundation

extension Container {
    private static var appStateSubsciption: AnyCancellable?

    var appState: Factory<Store<AppState>> {
        Factory(self) {
            var persistance = AppState.Persistance()
            let appState = Store<AppState>(initial: persistance.read())
            Self.appStateSubsciption = appState.published.sink { state in
                persistance.write(state)
            }
            return appState
        }
        .singleton
    }
}
