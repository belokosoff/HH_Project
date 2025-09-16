// Created by Maxim Belokosov.
//

import SwiftUI

struct CheckoutScreen: View {
    // MARK: Internal

    @ObservedObject var cartVM: CartViewModel
    @Environment(\.dismiss) var dismiss

    let order: Order
    let methods = ["Кредитная карта", "Apple Pay"]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(order.items) { item in
                        CheckoutItemView(item: item)
                    }

                    Text("Итого")
                        .font(.system(size: 22, weight: .bold))

                    VStack(spacing: 4) {
                        HStack {
                            Text("Товары:")
                                .foregroundStyle(.gray)
                                .font(.system(size: 14, weight: .regular))
                            Spacer()
                            Text("\(order.totals.items.formatted(.currency(code: order.totals.currency)))")
                                .font(.system(size: 14, weight: .regular))
                        }

                        HStack {
                            Text("Доставка:")
                                .foregroundStyle(.gray)
                                .font(.system(size: 14, weight: .regular))
                            Spacer()
                            Text("\(order.totals.shipping.formatted(.currency(code: order.totals.currency)))")
                                .font(.system(size: 14, weight: .regular))
                        }

                        HStack {
                            Text("Всего:")
                                .font(.system(size: 16, weight: .bold))
                            Spacer()
                            Text("\(order.totals.amount.formatted(.currency(code: order.totals.currency)))")
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
                    .padding(.vertical, 4)

                    Text("Стоимость доставки рассчитывается исходя из веса и адреса доставки.")
                        .font(.system(size: 16, weight: .regular))
                        .padding(.vertical, 8)

                    Text("Способы оплаты")
                        .font(.system(size: 22, weight: .bold))

                    ForEach(methods, id: \.self) { method in
                        PaymentMethodPicker(method: method, selectedMethod: $selectedMethod)
                    }

                    StyledButton(title: "Оплатить") {
                        Task {
                            let finalOrder = Order(
                                id: order.id,
                                number: order.number,
                                status: .processing,
                                createdAt: order.createdAt,
                                totals: order.totals,
                                payment: Payment(method: selectedMethod ?? "Не указано", status: "completed"),
                                shipping: order.shipping,
                                items: order.items
                            )
                            print("📤 Отправка заказа на сохранение: \(finalOrder.number)")
                            await cartVM.saveOrder(finalOrder)
                            print("✅ Заказ отправлен на сохранение")
                            dismiss()
                        }
                    }
                    .padding(.top, 16)
                }
                .padding(16)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Заказ №\(order.number)")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }

    // MARK: Private

    @State private var selectedMethod: String?
}

#Preview {
    let sharedOrdersVM = OrdersViewModel()
    let cartVM = CartViewModel(ordersVM: sharedOrdersVM)

    // Создадим тестовый заказ
    let testItem = Item(
        productId: "p1",
        title: "Шелковая блузка",
        variant: Variant_cart(color: "Белый", size: "S"),
        price: 7280,
        currency: "RUB",
        quantity: 2,
        imageUrl: URL(string: "https://via.placeholder.com/56x56")
    )

    let order = Order(
        id: "ord_abc123",
        number: 1001,
        status: .processing,
        createdAt: Date(),
        totals: Totals(
            items: 14560,
            shipping: 500,
            discount: 0,
            amount: 15060,
            currency: "RUB"
        ),
        payment: Payment(method: "credit_card", status: "pending"),
        shipping: Shipping(
            address: Address(city: "Москва", street: "ул. Ленина, 10", postcode: "123456", country: "Россия"),
            eta: nil
        ),
        items: [testItem]
    )

    return CheckoutScreen(cartVM: cartVM, order: order)
}
