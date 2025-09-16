// Created by Maxim Belokosov.
//

import SwiftUI

struct ProductsView: View {
    // MARK: Lifecycle

    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Internal

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                SearchField(text: $viewModel.searchText)
                    .padding(.horizontal)

                CategorySlide(
                    selectedCategory: $viewModel.selectedCategory,
                    categories: Category.allCases
                )

                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredProducts) { product in
                            ProductCard(product: product)
                        }
                        if !viewModel.products.isEmpty {
                            Color.clear.frame(height: 48).isLoading($viewModel.isLoadingNextPage)
                                .onAppear {
                                    Task {
                                        await viewModel.loadNextProducts()
                                    }
                                }
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
            .navigationDestination(for: ProductRoute.self) { route in
                switch route {
                case let .detail(product):
                    let productDetails = ProductDetails(from: product)
                    ProductDetailView(productDetails: productDetails)
                }
            }
        }
        .ignoresSafeArea(.all)
    }

    // MARK: Private

    @ObservedObject private var viewModel: ProductsViewModel
}

#Preview {
    ProductsView(viewModel: ProductsViewModel())
}
