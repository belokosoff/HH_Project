// Created by Maxim Belokosov.
//

struct Address: Codable, Hashable {
    let city: String
    let street: String
    let postcode: String
    let country: String
}
