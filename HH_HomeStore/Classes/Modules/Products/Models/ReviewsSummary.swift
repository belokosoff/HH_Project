// Created by Maxim Belokosov.
//

struct ReviewsSummary: Codable {
    let rating: Double
    let total: Int
    let breakdown: [String: Int] // например, "5": 12, "4": 3
}
