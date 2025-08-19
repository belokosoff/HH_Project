//
//  ProfileScreenView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

import SwiftUI

struct ProfileScreenView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Аватар и данные пользователя
                VStack(spacing: 12) {
                    Image("woman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 128, height: 128)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                        )
                    
                    Text("Александра")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Text("alexandra.k@email.com")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .tint(.gray)
                }
                .padding(.top, 40)
                
                // Кнопки профиля
                VStack(alignment: .leading, spacing: 24) {
                    ButtonAtProfile(
                        title: "Заказы",
                        image: "car",
                        destination: OrdersScreenView()
                    )
                    ButtonAtProfile(
                        title: "Помощь",
                        image: "help",
                        destination: ProfileView() // или HelpView()
                    )
                    ButtonAtProfile(
                        title: "Выйти",
                        image: "back",
                        destination: Text("")
                    )
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .navigationTitle("Профиль")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ProfileScreenView()
}
