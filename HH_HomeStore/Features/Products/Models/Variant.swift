//
//  Variant.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 02.09.2025.
//

struct Variant: Codable {
    let variantId: String
    let color: String
    let size: String
    let price: Double
    let inStock: Bool
    let stockLeft: Int
}
