// Created by Maxim Belokosov.
//

import SwiftUI

// MARK: - LoadingModifier

struct LoadingModifier: ViewModifier {
    @Binding var isLoading: Bool

    func body(content: Content) -> some View {
        content
            .opacity(isLoading ? 0 : 1)
            .overlay {
                if isLoading {
                    LoaderView()
                }
            }
    }
}

extension View {
    func isLoading(_ isLoading: Binding<Bool>) -> some View {
        modifier(LoadingModifier(isLoading: isLoading))
    }
}
