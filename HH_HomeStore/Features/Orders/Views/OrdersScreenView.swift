//
//  OrdersScreenView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct OrdersScreenView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: OrdersViewModel
    
    init(vm: OrdersViewModel){
        self.vm = vm
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if vm.isLoading {
                    ProgressView("Загрузка заказов...")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                } else if vm.orders.first != nil {
                    ForEach(vm.orders) { order in
                        OrderItem(order: order)
                    }
                } else {
                    Text("Заказы не найдены")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .padding()
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
        }
    }
}

#Preview {
    OrdersScreenView(vm: OrdersViewModel())
}
