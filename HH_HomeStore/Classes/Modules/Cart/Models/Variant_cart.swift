// Created by Maxim Belokosov.
//

struct Variant_cart: Codable, Hashable, Equatable {
    let color: String
    let size: String

    var dictionary: [String: String] {
        ["color": color, "size": size]
    }
}
