// Created by Maxim Belokosov.
//

import SwiftUI

struct OrdersScreenView: View {
    // MARK: Lifecycle

    init(vm: OrdersViewModel) {
        self.vm = vm
    }

    // MARK: Internal

    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: OrdersViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                if vm.isLoading {
                    LoaderView()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                } else if vm.orders.first != nil {
                    ForEach(vm.orders) { order in
                        OrderItem(order: order)
                            .padding(16)
                    }
                } else {
                    OrdersScreenPlaceholder()
                }
            }
            .navigationTitle("Мои заказы")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image("back")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .frame(width: 44, height: 44)
                    .padding(.leading, 8)
                }
            }
            .padding(.top)
            .onAppear {
                Task {
                    await vm.loadOrders()
                }
            }
        }
    }
}

#Preview {
    OrdersScreenView(vm: OrdersViewModel())
}
