// Created by Maxim Belokosov.
//

import Factory
import SwiftUI

struct LogoutView: View {
    var body: some View {
        @Injected(\.appState) var appState
        Text("Logout View")
            .onAppear {
                appState[\.isAuthorized] = false
            }
    }
}
