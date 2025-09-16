// Created by Maxim Belokosov.
//

import SwiftUI

@main
struct HH_HomeStoreApp: App {
    private let composition = AppComposition()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(composition)
        }
    }

    // MARK: Private

    @State private var isAuthorized: Bool = false
}
