//
//  CartItem.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

import SwiftUI

struct CartItemView: View {
    let item: CartItem
    @ObservedObject private var viewModel: CartViewModel

    // Fixed: Include both parameters
    init(item: CartItem, viewModel: CartViewModel) {
        self.item = item
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: item.imageUrl) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .scaledToFill()
            .frame(width: 56, height: 56)
            .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.system(size: 16, weight: .semibold))

                let options = item.variant.map { "\($0): \($1)" }.joined(separator: ", ")
                Text("Цена: \(item.price.formatted(.currency(code: "RUB"))), \(options)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }

            Spacer()

            HStack(alignment: .center, spacing: 8) {
                Button {
                    viewModel.updateQuantity(for: item.id, newQuantity: item.quantity - 1)
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 28, height: 28)
                        Image(systemName: "minus")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                .disabled(item.quantity <= 1)

                Text("\(item.quantity)")
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 28)

                Button {
                    viewModel.updateQuantity(for: item.id, newQuantity: item.quantity + 1)
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 28, height: 28)
                        Image(systemName: "plus")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CartItemView(
        item: CartItem(
            id: "item-1",
            productId: "p1",
            title: "Шелковая блузка",
            variant: ["size": "S", "color": "Белый"],
            price: 7280,
            currency: "RUB",
            quantity: 1,
            imageUrl: URL(string: "https://via.placeholder.com/56x56")
        ),
        viewModel: CartViewModel()
    )
}
