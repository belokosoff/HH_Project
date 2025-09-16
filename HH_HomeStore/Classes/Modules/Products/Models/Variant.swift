// Created by Maxim Belokosov.
//

struct Variant: Codable {
    let variantId: String
    let color: String
    let size: String
    let price: Double
    let inStock: Bool
    let stockLeft: Int
}
