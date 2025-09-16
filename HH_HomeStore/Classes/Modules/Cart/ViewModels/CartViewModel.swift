// Created by Maxim Belokosov.
//

import Foundation

public class CartViewModel: ObservableObject {
    // MARK: Lifecycle

    init(ordersVM: OrdersViewModel) {
        self.ordersVM = ordersVM
        // cart изначально nil — будет загружен или создан при первом добавлении
    }

    // MARK: Public

    public func loadCart() async {
        do {
            guard let url = Bundle.main.url(forResource: "cart", withExtension: "json") else {
                print("❌ Файл cart.json не найден")
                return
            }

            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let loadedCart = try decoder.decode(Cart.self, from: data)

            await MainActor.run {
                self.cart = loadedCart
            }
        } catch {
            print("❌ Ошибка загрузки корзины: \(error.localizedDescription)")
        }
    }

    public func updateQuantity(for itemId: String, newQuantity: Int) {
        guard newQuantity >= 1 else {
            return
        }
        guard var existingCart = cart else {
            return
        } // ← проверка на nil

        guard let index = existingCart.items.firstIndex(where: { $0.id == itemId }) else {
            return
        }

        existingCart.items[index].quantity = newQuantity
        recalculateCart(items: existingCart.items)
    }

    public func removeItem(withId itemId: String) {
        guard var existingCart = cart else {
            return
        } // ← проверка на nil
        let updatedItems = existingCart.items.filter { $0.id != itemId }
        recalculateCart(items: updatedItems)
    }

    public func clearCart() {
        cart = nil // ← просто обнуляем
    }

    // MARK: Internal

    @Published var showingCheckout = false
    @Published var createdOrder: Order?

    @Published var cart: Cart? // ← СДЕЛАЛИ ОПЦИОНАЛЬНЫМ

    func addToCart(_ item: CartItem) {
        // Если cart == nil — создаём новый
        var updatedItems: [CartItem]

        if let existingCart = cart {
            updatedItems = existingCart.items
        } else {
            updatedItems = []
        }

        if let index = updatedItems.firstIndex(where: { $0.productId == item.productId && $0.variant == item.variant }) {
            updatedItems[index].quantity += item.quantity
        } else {
            updatedItems.append(item)
        }

        recalculateCart(items: updatedItems)
    }

    func createOrder(paymentMethod: String? = nil) -> Order? {
        guard let existingCart = cart, !existingCart.items.isEmpty else {
            return nil
        }

        return Order(
            id: UUID().uuidString,
            number: Int(Date().timeIntervalSince1970),
            status: .processing,
            createdAt: Date(),
            totals: Totals(
                items: existingCart.subtotal,
                shipping: 500,
                discount: 0,
                amount: existingCart.subtotal + 500,
                currency: existingCart.currency
            ),
            payment: Payment(method: paymentMethod ?? "Не указано", status: "pending"),
            shipping: Shipping(
                address: Address(city: "", street: "", postcode: "", country: ""),
                eta: nil
            ),
            items: existingCart.items.map { item in
                Item(
                    productId: item.productId,
                    title: item.title,
                    variant: item.variant,
                    price: item.price,
                    currency: item.currency,
                    quantity: item.quantity,
                    imageUrl: item.imageUrl
                )
            }
        )
    }

    func saveOrder(_ order: Order) async {
        await ordersVM.saveOrder(order)
        clearCart()
    }

    // MARK: Private

    private let ordersVM: OrdersViewModel

    private func recalculateCart(items: [CartItem]) {
        let totalItems = items.reduce(0) { $0 + $1.quantity }
        let subtotal = items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
        let currency = items.first?.currency ?? "RUB"

        cart = Cart(
            items: items,
            totalItems: totalItems,
            subtotal: subtotal,
            currency: currency
        )
    }
}
