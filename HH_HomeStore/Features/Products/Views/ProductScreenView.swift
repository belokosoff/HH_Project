//
//  ProductScreenView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 27.08.2025.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject private var viewModel: ProductsViewModel
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Поиск
                SearchField(text: $viewModel.searchText)
                    .padding(.horizontal)
                
                CategorySlide(
                    selectedCategory: $viewModel.selectedCategory,
                    categories: Category.allCases
                )
                
                // Список товаров
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredProducts) { product in
                            ProductCard(product: product)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .onAppear {
                Task {
                    await viewModel.loadProducts()
                }
            }
        }
    }
}

#Preview {
    ProductsView(viewModel: ProductsViewModel())
}
