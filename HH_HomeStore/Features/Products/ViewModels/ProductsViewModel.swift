//
//  ProductsViewModel.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var searchText: String = ""
    @Published var selectedCategory: Category = .all

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadProducts()
        setupFiltering()
    }

    func loadProducts() {

        guard let url = Bundle.main.url(forResource: "products", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let loadedProducts = try? JSONDecoder().decode([Product].self, from: data)
        else {
            print("Не удалось загрузить продукты")
            return
        }

        DispatchQueue.main.async {
            self.products = loadedProducts
        }
    }

    private func setupFiltering() {
        $searchText
            .combineLatest($selectedCategory, $products)
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] searchText, category, products in
                self?.applyFilters(searchText: searchText, category: category, products: products)
            }
            .store(in: &cancellables)
    }

    private func applyFilters(searchText: String, category: Category, products: [Product]) {
        var filtered = products

        if category != .all {
            filtered = filtered.filter { $0.category == category }
        }

        if !searchText.isEmpty {
            let lowercasedText = searchText.lowercased()
            filtered = filtered.filter { $0.title.lowercased().contains(lowercasedText) }
        }

        DispatchQueue.main.async {
            self.filteredProducts = filtered
        }
    }

    func selectCategory(_ category: Category) {
        selectedCategory = category
    }

    func resetFilters() {
        selectedCategory = .all
        searchText = ""
    }
}
