//
//  OrderItem.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

// OrderItem.swift
import SwiftUI

struct OrderItem: View {
    let orderNumber: String
    let amount: String
    let status: String
    let date: String
    let productImages: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Заказ \(orderNumber)")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(amount)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            
            // Статус и дата
            HStack {
                Text(status)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 10) {
                ForEach(productImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                }
            }
            .padding(.top, 12)
                        Divider()
                .padding(.top, 16)
        }
        .padding(.horizontal, 16)
    }
}

// Пример превью
#Preview {
    OrderItem(
        orderNumber: "#123456",
        amount: "150 ₽",
        status: "В процессе",
        date: "15 мая 2024 г.",
        productImages: ["watch1", "watch2", "watch3"]
    )
}
