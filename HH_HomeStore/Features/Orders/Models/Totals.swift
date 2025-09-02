//
//  Totals.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 01.09.2025.
//


struct Totals: Codable, Hashable {
    let items: Double
    let shipping: Double
    let discount: Double
    let amount: Double
    let currency: String
}
