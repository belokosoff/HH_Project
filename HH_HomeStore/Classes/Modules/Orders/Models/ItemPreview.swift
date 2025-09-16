// Created by Maxim Belokosov.
//

//
//  ItemPreview.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
import Foundation

struct ItemPreview: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id = "productId"
        case thumbUrl
    }

    let id: String
    let thumbUrl: URL?
}
