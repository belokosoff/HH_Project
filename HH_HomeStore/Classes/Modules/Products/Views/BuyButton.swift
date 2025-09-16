// Created by Maxim Belokosov.
//

import SwiftUI

struct BuyButton: View {
    // MARK: Internal

    let product: ProductDetails
    let selectedSize: String?
    let selectedColor: String?
    let cartVM: CartViewModel // Передаём напрямую, а не через EnvironmentObject

    var body: some View {
        if let item = existingItem {
            HStack(spacing: 12) {
                Text("В корзине")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .frame(height: 40)
                    .frame(minWidth: 84, maxWidth: 480)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                Button {
                    let newQty = item.quantity - 1
                    if newQty > 0 {
                        cartVM.updateQuantity(for: item.id, newQuantity: newQty)
                    } else {
                        cartVM.removeItem(withId: item.id)
                    }
                } label: {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.gray.opacity(0.1))
                        .overlay(
                            Image(systemName: "minus")
                                .foregroundColor(.black)
                        )
                }

                Text("\(item.quantity)")
                    .font(.system(size: 16, weight: .medium))

                Button {
                    cartVM.updateQuantity(for: item.id, newQuantity: item.quantity + 1)
                } label: {
                    Circle()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.gray.opacity(0.1))
                        .overlay(
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        )
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(.clear)
            .clipShape(RoundedRectangle(cornerRadius: 12))

        } else {
            Button {
                guard let selectedSize, let selectedColor else {
                    return
                }
                let cartItem = CartItem(
                    id: UUID().uuidString,
                    productId: product.id,
                    title: product.title,
                    variant: variant,
                    price: product.price,
                    currency: product.currency,
                    quantity: 1,
                    imageUrl: product.gallery.first
                )
                cartVM.addToCart(cartItem)
            } label: {
                Text("В корзину")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(height: 40)
                    .frame(minWidth: 84, maxWidth: .infinity)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .disabled(selectedSize == nil || selectedColor == nil)
            .opacity((selectedSize == nil || selectedColor == nil) ? 0.5 : 1)
        }
    }

    // MARK: Private

    private var variant: Variant_cart {
        .init(color: selectedColor ?? "Без цвета", size: selectedSize ?? "Без размера")
    }

    private var existingItem: CartItem? {
        cartVM.cart?.items.first { $0.productId == product.id && $0.variant == variant }
    }
}

#Preview {
    let cartVM = CartViewModel(ordersVM: OrdersViewModel())
    return NavigationStack {
        ProductDetailView(productDetails: ProductDetails(from: Product.example))
            .environmentObject(cartVM)
    }
}
