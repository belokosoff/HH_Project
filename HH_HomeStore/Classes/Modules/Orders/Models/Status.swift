// Created by Maxim Belokosov.
//

//
//  Status.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//
enum Status: String, Codable {
    case processing
    case paid
    case shipped
    case delivered
    case canceled

    // MARK: Internal

    var displayName: String {
        switch self {
        case .processing: return "В процессе"
        case .paid: return "Оплачен"
        case .shipped: return "Отправлен"
        case .delivered: return "Доставлен"
        case .canceled: return "Отменён"
        }
    }
}
