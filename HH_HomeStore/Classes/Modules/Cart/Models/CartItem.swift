// Created by Maxim Belokosov.
//

//
//  CartItem.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct CartItem: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "itemId"
        case productId, title, variant, price, currency, quantity, imageUrl
    }

    let id: String
    let productId: String
    let title: String
    let variant: Variant_cart
    let price: Double
    let currency: String
    var quantity: Int
    let imageUrl: URL?
}
