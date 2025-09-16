// Created by Maxim Belokosov.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: Internal

    @Environment(\.dismiss) var dismiss

    let productDetails: ProductDetails

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(productDetails.gallery, id: \.absoluteString) { url in
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 300, height: 320)
                                case let .success(image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 320)
                                        .clipped()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                                        )
                                case .failure:
                                    Image("placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 320)
                                        .clipped()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                                        )
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }

                Text(productDetails.title)
                    .font(.custom("Lexend", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Цена")
                        .font(.custom("Lexend", size: 18))
                        .bold()
                        .foregroundColor(.black)
                    Text("\(productDetails.price, specifier: "%.0f") \(productDetails.currency)")
                        .font(.custom("Lexend", size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                }

                BuyButton(
                    product: productDetails,
                    selectedSize: selectedSize,
                    selectedColor: selectedColor, cartVM: CartViewModel(ordersVM: OrdersViewModel())
                )

                if !productDetails.options.colors.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Цвет")
                            .font(.custom("Lexend", size: 18))
                            .bold()
                            .foregroundColor(.black)

                        HStack(spacing: 12) {
                            ForEach(productDetails.options.colors, id: \.id) { colorOption in
                                ColorCircle(
                                    color: colorOption,
                                    isSelected: colorOption.name == selectedColor,
                                    onTap: {
                                        selectedColor = colorOption.name
                                        print("Выбран цвет: \(selectedColor ?? "нет")")
                                    }
                                )
                            }
                        }
                    }
                }

                if !productDetails.options.sizes.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Размер")
                            .font(.custom("Lexend", size: 18))
                            .bold()
                            .foregroundColor(.black)

                        HStack(spacing: 12) {
                            ForEach(productDetails.options.sizes, id: \.self) { size in
                                SizeButton(
                                    size: size,
                                    isSelected: Binding(
                                        get: { size == selectedSize },
                                        set: { _ in selectedSize = size }
                                    )
                                )
                            }
                        }
                    }
                }

                makeDisclosureGroup("Описание", content: {
                    Text(productDetails.description ?? "Описание отсутствует.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.vertical, 12)
                })

                makeDisclosureGroup("Характеристики", content: {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(productDetails.specs, id: \.name) { spec in
                            detailRow(label: spec.name, value: spec.value)
                        }
                    }
                })

                makeDisclosureGroup("Доставка и Возвраты", content: {
                    Text(productDetails.shipping.delivery)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.vertical, 12)
                })

                makeDisclosureGroup("Отзывы", content: {
                    ReviewSectionView(
                        reviews: [
                            productDetails.topReview,
                        ].compactMap { $0 }
                    )
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image("back")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.black)
                }
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image("share")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                }
            }
        }
        .padding(16)
    }

    @ViewBuilder
    func makeDisclosureGroup(_ title: String, content: @escaping () -> some View) -> some View {
        DisclosureGroup(title) {
            content()
        }
        .font(.custom("Lexend", size: 18))
        .fontWeight(.regular)
        .foregroundColor(.black)
    }

    @ViewBuilder
    func detailRow(label: String, value: String) -> some View {
        HStack {
            Text(label).foregroundColor(.gray)
            Spacer()
            Text(value).foregroundColor(.black)
        }
        .padding(.vertical, 8)
        .border(.gray.opacity(0.1), width: 0.5)
    }

    // MARK: Private

    @State private var selectedSize: String?
    @State private var selectedColor: String?
}

#Preview {
    NavigationStack {
        ProductDetailView(productDetails: ProductDetails(from: Product.example))
    }
}
