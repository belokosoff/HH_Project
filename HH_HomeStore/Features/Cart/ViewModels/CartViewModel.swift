//
//  CartViewModel.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cart: Cart?

    func loadCart() {
        guard let url = Bundle.main.url(forResource: "cart", withExtension: "json") else {
            print("❌ Файл cart.json не найден")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let loadedCart = try decoder.decode(Cart.self, from: data)
            DispatchQueue.main.async {
                self.cart = loadedCart
            }
        } catch {
            print("❌ Ошибка загрузки JSON: \(error.localizedDescription)")
        }
    }

    func addToCart(_ item: CartItem) {
        guard let cart = self.cart else {
            self.cart = Cart(items: [item], totalItems: item.quantity, subtotal: item.price * Double(item.quantity), currency: item.currency)
            return
        }

        var updatedItems = cart.items

        if let index = updatedItems.firstIndex(where: { $0.productId == item.productId && $0.variant == item.variant }) {
            updatedItems[index].quantity += item.quantity
        } else {
            updatedItems.append(item)
        }

        recalculateCart(items: updatedItems)
    }

    func updateQuantity(for itemId: String, newQuantity: Int) {
        guard newQuantity >= 1, let cart = self.cart else { return }
        guard let index = cart.items.firstIndex(where: { $0.id == itemId }) else { return }

        var updatedItems = cart.items
        updatedItems[index].quantity = newQuantity
        recalculateCart(items: updatedItems)
    }

    func removeItem(withId itemId: String) {
        guard let cart = self.cart else { return }
        let updatedItems = cart.items.filter { $0.id != itemId }
        recalculateCart(items: updatedItems)
    }

    func clearCart() {
        self.cart = Cart(items: [], totalItems: 0, subtotal: 0, currency: "RUB")
    }

    private func recalculateCart(items: [CartItem]) {
        let totalItems = items.reduce(0) { $0 + $1.quantity }
        let subtotal = items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
        let currency = items.first?.currency ?? "RUB"

        self.cart = Cart(
            items: items,
            totalItems: totalItems,
            subtotal: subtotal,
            currency: currency
        )
    }
}
