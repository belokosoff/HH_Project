// Created by Maxim Belokosov.
//

import Foundation

@MainActor
class CheckoutViewModel: ObservableObject {
    /*
     @Published var selectedPaymentMethod: PaymentMethod = .creditCard
     @Published var isLoading = false
     @Published var errorMessage: String?

     func createOrder(cart: Cart) async throws -> Order {
     isLoading = true
     errorMessage = nil

     try await Task.sleep(nanoseconds: 2_000_000_000)

     let order = Order(
     id: UUID().uuidString,
     items: cart.items,
     totalItems: cart.totalItems,
     subtotal: cart.subtotal,
     deliveryFee: 500,
     total: cart.subtotal + 500,
     currency: cart.currency,
     status: .pending,
     createdAt: Date()
     )

     isLoading = false
     return order
     }
     }

     enum PaymentMethod: String, CaseIterable {
     case creditCard = "Кредитная карта"
     case applePay = "Apple Pay"

     var icon: String {
     switch self {
     case .creditCard: return "creditcard"
     case .applePay: return "apple.pay"
     }
     }
     }
     */
}
