//
//  Category.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

enum Category: String, CaseIterable, Codable {
    case all = "Все"
    case clothes = "Одежда"
    case shoes = "Обувь"
    case accessories = "Аксессуары"

    var displayName: String {
        return self.rawValue
    }
}
