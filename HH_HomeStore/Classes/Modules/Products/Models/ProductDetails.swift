// Created by Maxim Belokosov.
//

import Foundation

// MARK: - ProductDetails

struct ProductDetails: Codable {
    let id: String
    let title: String
    let price: Double
    let currency: String
    let gallery: [URL]
    let options: Options
    let variants: [Variant]
    let selected: SelectedOptions
    let description: String?
    let specs: [Spec]
    let shipping: Shipping_Product
    let reviewsSummary: ReviewsSummary
    let topReview: Review?
}

extension ProductDetails {
    init(from product: Product) {
        id = product.id
        title = product.title
        price = product.price
        currency = product.currency
        gallery = [product.imageUrl]

        // ТРИ фиксированных цвета
        let colorOptions: [ColorOption] = [
            ColorOption(id: UUID().uuidString, name: "Белый", hex: "#FFFFFF"),
            ColorOption(id: UUID().uuidString, name: "Чёрный", hex: "#000000"),
            ColorOption(id: UUID().uuidString, name: "Красный", hex: "#FF0000"),
        ]

        options = .init(
            colors: colorOptions,
            sizes: ["S", "M", "L"]
        )

        variants = []
        selected = .init(color: product.color ?? "Чёрный", size: "M")

        description = "Описание для \(product.title). Материал: \(product.material ?? "не указан")."

        specs = [
            .init(name: "Материал", value: product.material ?? "Не указан"),
            .init(name: "Категория", value: product.category.rawValue.capitalized),
            .init(name: "Рейтинг", value: "\(product.rating) ★ (\(product.reviewsCount) отзывов)"),
        ]

        shipping = Shipping_Product(
            delivery: "Бесплатная доставка при заказе от 3000 ₽",
            returns: "Возврат возможен в течение 14 дней"
        )

        reviewsSummary = .init(
            rating: product.rating,
            total: product.reviewsCount,
            breakdown: [
                "5": Int(product.rating * 20),
                "4": Int((5 - product.rating) * 20),
                "3": 5,
                "2": 2,
                "1": 1,
            ]
        )

        topReview = nil
    }
}
