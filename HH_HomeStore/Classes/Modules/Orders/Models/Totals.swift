// Created by Maxim Belokosov.
//

struct Totals: Codable, Hashable {
    let items: Double
    let shipping: Double
    let discount: Double
    let amount: Double
    let currency: String
}
