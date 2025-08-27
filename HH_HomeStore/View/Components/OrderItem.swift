//
//  OrderItem.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//


import SwiftUI

struct OrderItem: View {
    let order: OrderPreview
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(order.displayNumber)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(order.displayAmount)
                    .font(.headline)
                    .foregroundColor(.black)
            }
            
            HStack {
                Text(order.status.displayName)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text(order.displayDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 10) {
                ForEach(order.itemsPreview) { item in
                    if let url = item.thumbUrl {
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } else {
                                Color.gray.opacity(0.3)
                            }
                        }
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                            )
                    }
                }
            }
            .padding(.top, 12)
            
            Divider()
                .padding(.top, 16)
        }
    }
}
// Пример превью
#Preview {
    let mockOrder = OrderPreview(
        id: "order-123",
        number: 123456,
        status: .processing,
        createdAt: Date(),
        totalAmount: 150,
        currency: "₽",
        itemsPreview: [
            ItemPreview(id: "p1", thumbUrl: URL(string: "https://via.placeholder.com/60x60/FFCC00/000000?text=1")),
            ItemPreview(id: "p2", thumbUrl: URL(string: "https://via.placeholder.com/60x60/FF6B6B/FFFFFF?text=2"))
        ]
    )
    return OrderItem(order: mockOrder)
}
