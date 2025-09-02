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
    let rating: Double
    let reviewsCount: Int
    let color: String?
    let material: String?
    let price: Double
    let currency: String
    let imageUrl: URL
}


extension Product {
    static let example = Product(
            id: "1",
            title: "Футболка хлопок 100%",
            category: .clothes,
            rating: 4.8,
            reviewsCount: 124,
            color: "Чёрный",
            material: "Хлопок",
            price: 1490,
            currency: "RUB",
            imageUrl: URL(string: "https://placehold.co/600x400?text=Hello+World")!
        )
    
    static func generateRandomProduct(count: Int) -> [Product] {
        let categories = Category.allCases
        let titles = [
            "Cool T-Shirt", "Stylish Jacket", "Elegant Dress", "Casual Sneakers",
            "Leather Boots", "Summer Hat", "Warm Scarf", "Denim Jeans",
            "Fancy Watch", "Sun Glasses", "Backpack", "Running Shoes"
        ]
        let colors = ["Red", "Blue", "Black", "White", "Green", "Yellow", "Pink", "Gray"]
        let materials = ["Cotton", "Leather", "Polyester", "Wool", "Silk", "Nylon", "Denim"]
        let baseImageURL = "https://example.com/images/product"

        var products: [Product] = []

        for i in 0..<count {
            let id = UUID().uuidString
            let title = titles.randomElement()!
            let category = categories.randomElement()!
            let rating = Double.random(in: 1.0...5.0)
            let reviewsCount = Int.random(in: 10...500)
            let color = colors.randomElement()
            let material = materials.randomElement()
            let price = Double.random(in: 10.0...200.0)
            let currency = "USD"
            let imageUrl = URL(string: "\(baseImageURL)_\(i).jpg")!

            let product = Product(
                id: id,
                title: title,
                category: category,
                rating: rating,
                reviewsCount: reviewsCount,
                color: color,
                material: material,
                price: price,
                currency: currency,
                imageUrl: imageUrl
            )

            products.append(product)
        }

        return products
    }
}
