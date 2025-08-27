//
//  OrdersViewModel.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//

// MARK: - OrdersViewModel.swift

import Foundation

@MainActor
class OrdersViewModel: ObservableObject {
    @Published var orders: [OrderPreview] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadOrders() async {
        isLoading = true
        errorMessage = nil

        do {
            let loadedOrders = try await loadFromJSON()
            self.orders = loadedOrders
        } catch {
            errorMessage = "Ошибка загрузки заказов"
        }
    }

    private func loadFromJSON() async throws -> [OrderPreview] {
        guard let url = Bundle.main.url(forResource: "orders", withExtension: "json") else {
            print("111")
            throw URLError(.badURL)
        }

        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([OrderPreview].self, from: data)
    }
}
