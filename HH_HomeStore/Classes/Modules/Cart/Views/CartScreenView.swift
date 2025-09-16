// Created by Maxim Belokosov.
//

import SwiftUI

// MARK: - CartScreenView

struct CartScreenView: View {
    // MARK: Lifecycle

    init(vm: CartViewModel) {
        self.vm = vm
    }

    // MARK: Internal

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button("Очистить") {
                        vm.clearCart()
                    }
                    .foregroundColor(.red)
                    .font(.system(size: 12))
                }
                .padding(.horizontal)

                if let cart = vm.cart, !cart.items.isEmpty {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack(spacing: 12) {
                            ForEach(cart.items) { item in
                                CartItemView(item: item, viewModel: vm)
                            }
                        }
                    }
                    .background(Color.white)
                    .padding(.vertical, 8)

                } else {
                    Spacer()
                    Text("Корзина пуста")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .padding()
                    Spacer()
                }

                StyledButton(title: "Оформить заказ") {
                    Task {
                        if let order = vm.createOrder() {
                            vm.createdOrder = order
                            vm.showingCheckout = true
                            print("123")
                        }
                    }
                }
                .padding(.top, 8)
            }
            .padding(16)
            .onAppear {
                Task {
                    await vm.loadCart()
                }
            }
        }
        .sheet(isPresented: $vm.showingCheckout) {
            if let order = vm.createdOrder {
                CheckoutScreen(cartVM: vm, order: order)
            }
        }
    }

    // MARK: Private

    @ObservedObject private var vm: CartViewModel
}

#Preview {
    let ordersVM = OrdersViewModel()
    let cartVM = CartViewModel(ordersVM: ordersVM)
    CartScreenView(vm: cartVM)
}
