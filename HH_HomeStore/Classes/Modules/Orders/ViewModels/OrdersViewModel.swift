// Created by Maxim Belokosov.
//

import Foundation

class OrdersViewModel: ObservableObject {
    // MARK: Lifecycle

    init() {}

    // MARK: Internal

    @Published var orders: [OrderPreview] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    @MainActor
    func loadOrders() async {
        isLoading = true
        errorMessage = nil

        do {
            let loadedOrders = try await loadFromJSON()
            orders = loadedOrders
        } catch {
            errorMessage = "Ошибка загрузки заказов"
            print("❌ Ошибка загрузки заказов: \(error)")
        }
        isLoading = false
    }

    @MainActor
    func saveOrder(_ order: Order) async {
        do {
            let preview = OrderPreview(
                id: order.id,
                number: order.number,
                status: order.status,
                createdAt: order.createdAt,
                totalAmount: order.totals.amount,
                currency: order.totals.currency,
                itemsPreview: order.items.map { item in
                    ItemPreview(
                        id: item.productId,
                        thumbUrl: item.imageUrl
                    )
                }
            )

            var updatedOrders = orders
            updatedOrders.insert(preview, at: 0)

            try await saveToJSON(updatedOrders)

            orders = updatedOrders

        } catch {
            errorMessage = "Ошибка сохранения заказа"
            print("❌ Ошибка сохранения заказа: \(error)")
        }
    }

    // MARK: Private

    private func loadFromJSON() async throws -> [OrderPreview] {
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsPath.appendingPathComponent("orders.json")

        if !FileManager.default.fileExists(atPath: fileURL.path) {
            guard let templateURL = Bundle.main.url(forResource: "orders", withExtension: "json") else {
                return []
            }
            let templateData = try Data(contentsOf: templateURL)
            try templateData.write(to: fileURL, options: .atomic)
        }

        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([OrderPreview].self, from: data)
    }

    private func saveToJSON(_ orders: [OrderPreview]) async throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.outputFormatting = .prettyPrinted

        let data = try encoder.encode(orders)

        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsPath.appendingPathComponent("orders.json")

        try data.write(to: fileURL, options: .atomic)
    }
}
