// Created by Maxim Belokosov.
//

import SwiftUI

struct CheckoutItemView: View {
    let item: Item

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: item.imageUrl) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .scaledToFill()
            .frame(width: 58, height: 58)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.system(size: 16, weight: .medium))
                let options = "Цвет: \(item.variant.color), Размер: \(item.variant.size)"
                Text(options.isEmpty ? "" : options)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(height: 72)
    }
}

#Preview {
    CheckoutItemView(
        item: Item(
            productId: "p1",
            title: "Шелковая блузка",
            variant: Variant_cart(color: "Белый", size: "S"),
            price: 7280,
            currency: "RUB",
            quantity: 1,
            imageUrl: URL(string: "https://via.placeholder.com/58x58")
        )
    )
}
