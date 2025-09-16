// Created by Maxim Belokosov.
//

enum Category: String, CaseIterable, Codable {
    case all
    case clothes
    case shoes
    case accessories

    // MARK: Internal

    var displayName: String {
        switch self {
        case .all: return "Все"
        case .clothes: return "Одежда"
        case .shoes: return "Обувь"
        case .accessories: return "Аксессуары"
        }
    }
}
