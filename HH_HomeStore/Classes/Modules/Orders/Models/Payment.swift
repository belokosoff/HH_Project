// Created by Maxim Belokosov.
//

struct Payment: Codable, Hashable {
    let method: String
    let status: String
}
