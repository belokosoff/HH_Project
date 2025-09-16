// Created by Maxim Belokosov.
//

import Combine
import Factory
import Foundation
import SwiftUI

class ProductsViewModel: ObservableObject {
    // MARK: Lifecycle

    init() {
        Publishers.CombineLatest($searchText, $selectedCategory)
            .sink { [weak self] search, category in
                guard let self else {
                    return
                }
                applyFilters(searchText: search, category: category, products: products)
            }
            .store(in: &cancellables)
    }

    // MARK: Internal

    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var searchText: String = ""
    @Published var selectedCategory: Category = .all

    @Published var isLoading: Bool = true
    @Published var isLoadingNextPage: Bool = false

    func loadProducts() async {
        isLoading = true
        defer { isLoading = false }
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else {
            print("Файл products.json не найден в папке Mock")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let loadedProducts = try JSONDecoder().decode([Product].self, from: data)
            await MainActor.run {
                self.products = loadedProducts
                self.applyFilters(
                    searchText: self.searchText,
                    category: self.selectedCategory,
                    products: loadedProducts
                )
            }
        } catch {
            print("Ошибка загрузки JSON: \(error)")
        }
    }

    @MainActor
    func loadNextProducts() async {
        await MainActor.run { isLoadingNextPage = true }
        try? await Task.sleep(nanoseconds: 1_000_000_000)

        let newProducts = Product.generateRandomProduct(count: 30)

        await MainActor.run {
            self.products += newProducts
            self.applyFilters(
                searchText: self.searchText,
                category: self.selectedCategory,
                products: self.products
            )
            self.isLoadingNextPage = false
        }
    }

    func selectCategory(_ category: Category) {
        selectedCategory = category
    }

    func resetFilters() {
        selectedCategory = .all
        searchText = ""
    }

    // MARK: Private

    private var cancellables = Set<AnyCancellable>()

    private func applyFilters(searchText: String, category: Category, products: [Product]) {
        var filtered = products

        if category != .all {
            filtered = filtered.filter { $0.category == category }
        }

        if !searchText.isEmpty {
            let lowercasedText = searchText.lowercased()
            filtered = filtered.filter { $0.title.lowercased().contains(lowercasedText) }
        }

        filteredProducts = filtered
    }
}
