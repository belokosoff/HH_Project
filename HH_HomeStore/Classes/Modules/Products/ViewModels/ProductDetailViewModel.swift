// Created by Maxim Belokosov.
//

// ProductDetailViewModel.swift

import Combine
import Foundation

@MainActor
class ProductDetailViewModel: ObservableObject {
    // MARK: Lifecycle

    init(productId: String) {
        self.productId = productId
    }

    // MARK: Internal

    @Published var product: ProductDetails?
    @Published var isLoading = true
    @Published var error: String?

    func loadProduct() async {
        // Здесь вы бы вызвали API: GET /products/\(productId)
        // Пока загрузим из JSON-файла (например, product_\(id).json)

        guard let url = Bundle.main.url(forResource: "product_\(productId)", withExtension: "json") else {
            error = "Товар не найден"
            isLoading = false
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let result = try JSONDecoder().decode(ProductDetails.self, from: data)
            product = result
        } catch {
            self.error = "Ошибка загрузки: \(error.localizedDescription)"
        }

        isLoading = false
    }

    // MARK: Private

    private let productId: String
}
