//
//  ProfileView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//


import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack(spacing: 12) {
                    Image("woman")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 128, height: 128)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.gray.opacity(0.3), lineWidth: 2)
                        )
                    
                    Text("Александра")
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("alexandra.k@email.com")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                        .tint(.gray)
                }
                .padding(.top, 40)
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    FieldInfoAtProfile(
                        title: "Телефон",
                        info: "+7 (916) 123-45-67",
                        image: "phone"
                    )
                    FieldInfoAtProfile(
                        title: "Адрес",
                        info: "Москва, ул. Тверская, д. 10",
                        image: "map_pin"
                    )
                    FieldInfoAtProfile(
                        title: "Дата рождения",
                        info: "1 января 1990 г.",
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
                    Button(action: {}) {
                        Image("gear")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
