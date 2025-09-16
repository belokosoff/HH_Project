// Created by Maxim Belokosov.
//

import Foundation

struct Item: Codable, Identifiable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id = "itemId"
        case productId, title, variant, price, currency, quantity, imageUrl
    }

    let id = UUID()
    let productId: String
    let title: String
    let variant: Variant_cart
    let price: Double
    let currency: String
    let quantity: Int
    let imageUrl: URL?
}
