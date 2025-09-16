// Created by Maxim Belokosov.
//

import Foundation

struct Order: Codable, Identifiable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "orderId"
        case number, status, createdAt, totals, payment, shipping, items
    }

    let id: String
    let number: Int
    let status: Status
    let createdAt: Date

    let totals: Totals
    let payment: Payment
    let shipping: Shipping
    let items: [Item]
}
