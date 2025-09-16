// Created by Maxim Belokosov.
//

import Foundation

struct Shipping: Codable, Hashable {
    let address: Address
    let eta: Date?
}
