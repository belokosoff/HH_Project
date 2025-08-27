//
//  OrderPreview.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct OrderPreview: Codable, Identifiable {
    let id: String
    let number: Int
    let status: Status
    let createdAt: Date
    let totalAmount: Double
    let currency: String
    let itemsPreview: [ItemPreview]

    enum CodingKeys: String, CodingKey {
        case id = "orderId"
        case number, status, createdAt, totalAmount, currency, itemsPreview
    }

    var displayNumber: String {
        "#\(number)"
    }

    var displayAmount: String {
        "\(totalAmount) \(currency)"
    }

    var displayDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: createdAt)
    }
}
