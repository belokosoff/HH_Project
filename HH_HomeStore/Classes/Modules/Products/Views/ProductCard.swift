// Created by Maxim Belokosov.
//

import SwiftUI

struct ProductCard: View {
    let product: Product

    var body: some View {
        NavigationLink(value: ProductRoute.detail(product)) {
            VStack {
                AsyncImage(url: product.imageUrl) { phase in
                    switch phase {
                    case .empty:
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray)
                    case let .success(image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray)
                            .overlay(Image(systemName: "photo"))
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 201)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))

                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.custom("Lexend", size: 18))
                        .foregroundStyle(.black)
                        .bold()

                    HStack(spacing: 4) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("★ \(product.rating, specifier: "%.1f") · (\(product.reviewsCount)) · \(product.color ?? "—")")
                                .font(.custom("Lexend", size: 16))
                                .foregroundStyle(.gray)

                            Text("\(product.price, specifier: "%.2f") \(product.currency == "RUB" ? "руб" : product.currency)")
                                .font(.custom("Lexend", size: 16))
                                .foregroundStyle(.gray)
                        }

                        Spacer()

                        Button("Купить") {}
                            .font(.custom("Lexend", size: 14))
                            .foregroundStyle(.white)
                            .frame(width: 84, height: 32)
                            .background(Color.black)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.vertical, 16)
    }
}

#Preview {
    ProductCard(product: Product.example)
        .padding()
}
