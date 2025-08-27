//
//  ProfileView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//


import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

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

                // Info Fields
                VStack(alignment: .leading, spacing: 24) {
                    FieldInfoAtProfile(
                        title: "Телефон",
                        info: viewModel.userProfile?.phone ?? "",
                        image: "phone"
                    )
                    FieldInfoAtProfile(
                        title: "Адрес",
                        info: "\(viewModel.userProfile?.address.city ?? ""), \(viewModel.userProfile?.address.street ?? "")",
                        image: "map_pin"
                    )
                    FieldInfoAtProfile(
                        title: "Дата рождения",
                        info: viewModel.userProfile?.birthDate.formatted(
                            Date.FormatStyle()
                                .year()
                                .month(.twoDigits)
                                .day()
                        ) ?? "",
                        image: "calendar"
                    )

                }
                .padding(.top, 30)

                Spacer()
            }
            .padding(.horizontal, 16)
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("back")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.black)
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Перейти в настройки
                    }) {
                        Image("gear")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .onAppear {
            if viewModel.userProfile == nil {
                Task { await viewModel.loadProfile() }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
