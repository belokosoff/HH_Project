// Created by Maxim Belokosov.
//

import Factory
import SwiftUI

struct ProfileScreenView: View {
    // MARK: Lifecycle

    // MARK: - Инициализатор

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Internal

    @ObservedObject var viewModel: ProfileViewModel

    @Injected(\.appState) var appState

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Avatar & Info
                VStack(spacing: 12) {
                    AsyncImage(url: viewModel.userProfile?.avatarUrl) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else {
                            Image(systemName: "person.circle")
                                .font(.system(size: 128))
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 128, height: 128)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                    )

                    Text(viewModel.userProfile?.name ?? "Загрузка...")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)

                    Text(viewModel.userProfile?.email ?? "")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }
                .padding(.top, 40)

                // Buttons
                VStack(alignment: .leading, spacing: 24) {
                    ButtonAtProfile(
                        title: "Заказы",
                        image: "car",
                        destination: OrdersScreenView(vm: OrdersViewModel())
                    )
                    ButtonAtProfile(
                        title: "Помощь",
                        image: "help",
                        destination: ProfileView(viewModel: ProfileViewModel())
                    )
                    ButtonAtProfile(
                        title: "Выйти",
                        image: "back",
                        destination: LogoutView()
                    )
                }
                .padding(.top, 30)

                Spacer()
            }
            .padding(.horizontal, 16)
            .onAppear {
                Task {
                    await viewModel.loadProfile()
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ProfileScreenView(viewModel: ProfileViewModel())
}
