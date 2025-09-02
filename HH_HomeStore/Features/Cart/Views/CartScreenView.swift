//
//  CartScreenView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 17.08.2025.
//

import SwiftUI

struct CartScreenView: View {
    @ObservedObject private var vm: CartViewModel

    init(vm: CartViewModel){
        self.vm=vm
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Очистить") {
                    vm.clearCart()
                }
                .foregroundColor(.red)
                .font(.system(size: 12))
            }

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
                // path.append(.checkout) — если есть роут
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
}

// MARK: - Preview
#Preview {
    CartScreenView(vm: CartViewModel())
}
