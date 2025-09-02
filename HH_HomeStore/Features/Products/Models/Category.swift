//
//  Category.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

enum Category: String, CaseIterable, Codable {
    case all
    case clothes
    case shoes
    case accessories

    var displayName: String {
        switch self {
        case .all: return "Все"
        case .clothes: return "Одежда"
        case .shoes: return "Обувь"
        case .accessories: return "Аксессуары"
        }
    }
}
