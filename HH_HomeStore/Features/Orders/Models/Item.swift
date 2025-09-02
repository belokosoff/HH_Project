//
//  OrderItem.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 01.09.2025.
//

import Foundation

struct Item: Codable, Identifiable, Hashable {
    let id = UUID()
    let productId: String
    let title: String
    let variant: [String: String]
    let price: Double
    let currency: String
    let quantity: Int
    let imageUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "itemId"
        case productId, title, variant, price, currency, quantity, imageUrl
    }
}
