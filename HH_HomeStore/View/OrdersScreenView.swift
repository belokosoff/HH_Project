//
//  OrdersScreenView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct OrdersScreenView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(0..<4) { _ in
                        OrderItem(
                            orderNumber: "#123456",
                            amount: "150 ₽",
                            status: "В процессе",
                            date: "15 мая 2024 г.",
                            productImages: ["watch1", "watch2", "watch3"]
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("Мои заказы")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .frame(width: 44, height: 44)
                    .padding(.leading, 8) // ← отступ слева
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    OrdersScreenView()
}
