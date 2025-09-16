// Created by Maxim Belokosov.
//

import SwiftUI

struct CustomTabView: View {
    // MARK: Internal

    // Убрали @EnvironmentObject — теперь всё передаётся явно
    let productsVM: ProductsViewModel
    let cartVM: CartViewModel
    let profileVM: ProfileViewModel

    // MARK: Body

    var body: some View {
        TabView(selection: $selection) {
            ProductsView(viewModel: productsVM)
                .tag(0)
                .tabItem {
                    Image(selection == 0 ? "home_active" : "home")
                    Text("Главная")
                }

            CategoryView()
                .tag(1)
                .tabItem {
                    Image(selection == 1 ? "category_active" : "category")
                    Text("Категории")
                }

            CartScreenView(vm: cartVM)
                .tag(2)
                .tabItem {
                    Image(selection == 2 ? "cart_active" : "cart")
                    Text("Корзина")
                }

            ProfileScreenView(viewModel: profileVM)
                .tag(3)
                .tabItem {
                    Image(selection == 3 ? "profile_active" : "profile")
                    Text("Профиль")
                }
        }
        .tint(.orange)
        .environmentObject(cartVM)
    }

    // MARK: Private

    @State private var selection: Int = 0
}

#Preview {
    let productsVM = ProductsViewModel()
    let cartVM = CartViewModel(ordersVM: OrdersViewModel())
    let profileVM = ProfileViewModel()

    return CustomTabView(
        productsVM: productsVM,
        cartVM: cartVM,
        profileVM: profileVM
    )
}
