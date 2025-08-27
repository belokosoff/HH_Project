//
//  ItemPreview.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct ItemPreview: Codable, Identifiable {
    let id: String
    let thumbUrl: URL?

    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case thumbUrl
    }
}
