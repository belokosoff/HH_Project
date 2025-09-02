//
//  Order.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 01.09.2025.
//

import Foundation

struct Order: Codable, Identifiable, Hashable {
    let id: String
    let number: Int
    let status: Status
    let createdAt: Date
    
    let totals: Totals
    let payment: Payment
    let shipping: Shipping
    let items: [Item]
    
    
    enum CodingKeys: String, CodingKey {
        case id = "orderId"
        case number, status, createdAt, totals, payment, shipping, items
    }
}
