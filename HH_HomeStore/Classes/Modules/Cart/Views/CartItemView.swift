// Created by Maxim Belokosov.
//

import SwiftUI

struct CartItemView: View {
    // MARK: Lifecycle

    init(item: CartItem, viewModel: CartViewModel) {
        self.item = item
        self.viewModel = viewModel
    }

    // MARK: Internal

    let item: CartItem

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

                let options = "Цвет: \(item.variant.color), Размер: \(item.variant.size)"
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

    // MARK: Private

    @ObservedObject private var viewModel: CartViewModel
}

// MARK: - Preview

#Preview {
    CartItemView(
        item: CartItem(
            id: "item-1",
            productId: "p1",
            title: "Шелковая блузка",
            variant: Variant_cart(color: "Белый", size: "S"),
            price: 7280,
            currency: "RUB",
            quantity: 1,
            imageUrl: URL(string: "https://via.placeholder.com/56x56")
        ),
        viewModel: CartViewModel(ordersVM: OrdersViewModel())
    )
}
