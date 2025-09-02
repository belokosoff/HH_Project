//
//  ProductDetailViewModel.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 02.09.2025.
//


// ProductDetailViewModel.swift

import Foundation
import Combine

@MainActor
class ProductDetailViewModel: ObservableObject {
    @Published var product: ProductDetails?
    @Published var isLoading = true
    @Published var error: String?

    private let productId: String

    init(productId: String) {
        self.productId = productId
    }

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
            self.product = result
        } catch {
            self.error = "Ошибка загрузки: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
