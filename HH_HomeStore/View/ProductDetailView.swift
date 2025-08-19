//
//  ProductDetailView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) var dismiss

    let images = ["dress", "dress", "dress"]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(images, id: \.self) { _ in
                            Image("dress")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 320)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 16)
                }

                Text("Платье с цветочным принтом")
                    .font(.custom("Lexend", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Цена")
                        .font(.custom("Lexend", size: 18))
                        .bold()
                        .foregroundColor(.black)
                    Text("2500 руб.")
                        .font(.custom("Lexend", size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                }

                StyledButton(title: "Купить") {
                    // действие покупки
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Цвет")
                        .font(.custom("Lexend", size: 18))
                        .bold()
                        .foregroundColor(.black)

                    HStack(spacing: 12) {
                        ColorCircle(color: .white, selected: false)
                        ColorCircle(color: .black, selected: true)
                        ColorCircle(color: .red, selected: false)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Размер")
                        .font(.custom("Lexend", size: 18))
                        .bold()
                        .foregroundColor(.black)

                    HStack(spacing: 12) {
                        SizeButton(size: "S", selected: false)
                        SizeButton(size: "M", selected: true)
                        SizeButton(size: "L", selected: false)
                    }
                }

                makeDisclosureGroup("Описание", content: {
                    Text("Элегантное платье с цветочным принтом, идеально подойдёт для прогулок и встреч с друзьями. Легкая ткань обеспечивает комфорт даже в жаркий день.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.vertical, 12)
                })

                makeDisclosureGroup("Характеристики", content: {
                    VStack(alignment: .leading, spacing: 12) {
                        detailRow(label: "Материал", value: "Хлопок 100%")
                        detailRow(label: "Посадка", value: "Классический")
                        detailRow(label: "Длина рукава", value: "Короткий")
                        detailRow(label: "Вырез горловины", value: "Круглый")
                        detailRow(label: "Узор", value: "Цветочный")
                        detailRow(label: "Случай", value: "На каждый день")
                    }
                })

                makeDisclosureGroup("Доставка и Возвраты", content: {
                    Text("Бесплатная доставка по России. Возврат возможен в течение 14 дней.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.vertical, 12)
                })

                makeDisclosureGroup("Отзывы", content: {
                    ReviewSectionView(
                        reviews: [
                            Review(
                                id: "1",
                                author: Author(
                                    name: "Chloe M.",
                                    avatarUrl: URL(string: "https://i.pravatar.cc/150?img=1")
                                ),
                                rating: 5,
                                createdAt: Date().addingTimeInterval(-60*60*24*30),
                                text: "Отличное платье, идеально сидит и выглядит ещё лучше в жизни!",
                                likes: 12,
                                dislikes: 1
                            ),
                            Review(
                                id: "2",
                                author: Author(
                                    name: "Isabella R.",
                                    avatarUrl: nil
                                ),
                                rating: 4,
                                createdAt: Date().addingTimeInterval(-60*60*24*45),
                                text: "Хорошее платье, но немного просвечивает. Нужна подкладка.",
                                likes: 7,
                                dislikes: 0
                            )
                        ]
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
        }.padding(16)
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
}


#Preview {
    NavigationStack {
        ProductDetailView()
    }
}
