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
        Publishers.CombineLatest($searchText, $selectedCategory)
            .sink { [weak self] search, category in
                guard let self else { return }
                self.applyFilters(searchText: search, category: category, products: self.products)
            }
            .store(in: &cancellables)
    }
    
    func loadProducts() async {
        guard let url = Bundle.main.url(forResource: "products",
                                        withExtension: "json") else {
            print("Файл products.json не найден в папке Mock")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let loadedProducts = try JSONDecoder().decode([Product].self, from: data)
            
            await MainActor.run {
                self.products = loadedProducts
                self.applyFilters(searchText: self.searchText,
                                  category: self.selectedCategory,
                                  products: loadedProducts)
            }
        } catch {
            print("Ошибка загрузки JSON: \(error)")
        }
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
        
        self.filteredProducts = filtered
    }
    
    func selectCategory(_ category: Category) {
        selectedCategory = category
    }
    
    func resetFilters() {
        selectedCategory = .all
        searchText = ""
    }
}
