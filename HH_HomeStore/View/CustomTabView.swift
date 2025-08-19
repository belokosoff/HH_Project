//  CustomTabView.swift
//  HH_HomeStore
//  Created by Maxim Belokosov on 17.08.2025.

import SwiftUI

struct CustomTabView: View {
    @Binding var selection: Int

    var body: some View {
        VStack(spacing: 0) {
            // Контент
            ZStack {
                switch selection {
                case 0: HomeView()
                case 1: CategoryView()
                case 2: CartScreenView()
                case 3: ProfileScreenView()
                default: HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Tab Bar
            HStack(alignment: .center) {
                TabBarButton(
                    index: 0,
                    isSelected: selection == 0,
                    action: { selection = 0 },
                    activeImage: "home_active",
                    inactiveImage: "home",
                    title: "Главная"
                )
                TabBarButton(
                    index: 1,
                    isSelected: selection == 1,
                    action: { selection = 1 },
                    activeImage: "category_active",
                    inactiveImage: "category",
                    title: "Категории"
                )
                TabBarButton(
                    index: 2,
                    isSelected: selection == 2,
                    action: { selection = 2 },
                    activeImage: "cart_active",
                    inactiveImage: "cart",
                    title: "Корзина"
                )
                TabBarButton(
                    index: 3,
                    isSelected: selection == 3,
                    action: { selection = 3 },
                    activeImage: "profile_active",
                    inactiveImage: "profile",
                    title: "Профиль"
                )
            }
            .padding(.vertical, 8)
            .background(Color.white.shadow(radius: 2))
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
