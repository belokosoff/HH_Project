// Created by Maxim Belokosov.
//

//
//  Cart.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct Cart: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case items, totalItems, subtotal, currency
    }

    var id = UUID()

    var items: [CartItem]
    var totalItems: Int
    var subtotal: Double
    var currency: String
}
