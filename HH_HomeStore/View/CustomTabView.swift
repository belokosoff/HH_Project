//  CustomTabView.swift
//  HH_HomeStore
//  Created by Maxim Belokosov on 17.08.2025.


import SwiftUI

struct CustomTabView: View {
    @State private var selection: Int = 0

    var body: some View {
        TabView(selection: $selection) {
            ProductsView(viewModel: ProductsViewModel())
                .tag(0)
                .tabItem {
                    Image(selection == 0 ? "home_active" : "home")
                    Text("Главная")
                }

            // Вкладка "Категории"
            CategoryView()
                .tag(1)
                .tabItem {
                    Image(selection == 1 ? "category_active" : "category")
                    Text("Категории")
                }

            // Вкладка "Корзина"
            CartScreenView(vm : CartViewModel())
                .tag(2)
                .tabItem {
                    Image(selection == 2 ? "cart_active" : "cart")
                    Text("Корзина")
                }

            // Вкладка "Профиль"
            ProfileScreenView(viewModel: ProfileViewModel())
                .tag(3)
                .tabItem {
                    Image(selection == 3 ? "profile_active" : "profile")
                    Text("Профиль")
                }
        }
        .tint(.orange)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    CustomTabView()
}
