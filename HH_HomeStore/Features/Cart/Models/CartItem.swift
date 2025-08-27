//
//  CartItem.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct CartItem: Codable, Identifiable {
    let id: String
    let productId: String
    let title: String
    let variant: [String: String]
    let price: Double
    let currency: String
    var quantity: Int
    let imageUrl: URL?

    enum CodingKeys: String, CodingKey {
        case id = "itemId"
        case productId, title, variant, price, currency, quantity, imageUrl
    }
}
