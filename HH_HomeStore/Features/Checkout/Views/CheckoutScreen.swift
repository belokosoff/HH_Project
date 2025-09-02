//
//  CheckoutView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 01.09.2025.
//

import SwiftUI

struct CheckoutScreen: View {
    var body: some View {
        Text("CheckoutScreen")
    }
    
    /*
    @Environment(\.presentationMode) var presentationMode

    @StateObject private var viewModel: CheckoutViewModel

    let cart: Cart

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("Заказ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 16)

                ScrollView(.vertical, showsIndicators: false) {
                    // Список товаров
                    ForEach(cart.items) { item in
                        HStack(spacing: 12) {
                            AsyncImage(url: item.imageUrl) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 48, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.system(size: 16))
                                Text("\(item.quantity) шт.")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                            }
                        }
                        .padding(.vertical, 8)
                    }

                    // Итого
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Итого")
                            .font(.headline)
                            .foregroundColor(.black)

                        HStack {
                            Text("Товары")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("\(cart.subtotal.formatted(.currency(code: "RUB"))) руб.")
                                .foregroundColor(.black)
                        }

                        HStack {
                            Text("Доставка")
                                .foregroundColor(.gray)
                            Spacer()
                            Text("500 руб.")
                                .foregroundColor(.black)
                        }

                        Divider()

                        HStack {
                            Text("Итого к оплате")
                                .font(.headline)
                                .foregroundColor(.black)
                            Spacer()
                            Text("\(cart.subtotal.formatted(.currency(code: "RUB"))) руб.")
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                    }

                    // Способ оплаты
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Способ оплаты")
                            .font(.headline)

                        Picker("Способ оплаты", selection: $viewModel.selectedPaymentMethod) {
                            ForEach(Payment.allCases, id: \.self) { method in
                                HStack {
                                    Image(systemName: method.icon)
                                        .foregroundColor(.black)
                                    Text(method.rawValue)
                                    Spacer()
                                    if method == viewModel.selectedPaymentMethod {
                                        Image(systemName: "circle.fill")
                                            .foregroundColor(.black)
                                    } else {
                                        Image(systemName: "circle")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(8)
                                .border(Color.gray.opacity(0.2), width: 1)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    }

                    Button("Оплатить") {
                        Task {
                            do {
                                let order = try await viewModel.createOrder(cart: cart)
                                // Сохраняем заказ в Profile (например, через ProfileViewModel)
                                // profileViewModel.addOrder(order)
                                presentationMode.wrappedValue.dismiss()
                            } catch {
                                viewModel.errorMessage = "Ошибка создания заказа: \(error.localizedDescription)"
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .font(.headline)
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                }
            }
            .padding(.horizontal, 16)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Заказ")
        }
    }
     */
}
