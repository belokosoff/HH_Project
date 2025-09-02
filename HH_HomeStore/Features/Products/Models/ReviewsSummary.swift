//
//  ReviewsSummary.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 02.09.2025.
//


struct ReviewsSummary: Codable {
    let rating: Double
    let total: Int
    let breakdown: [String: Int] // например, "5": 12, "4": 3
}
