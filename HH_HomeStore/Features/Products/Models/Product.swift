//
//  Product.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let title: String
    let category: Category
    let rating: Float
    let reviewsCount: Int
    let color: String?
    let material: String?
    let price: Float
    let currency: String
    let imageUrl: URL
}
