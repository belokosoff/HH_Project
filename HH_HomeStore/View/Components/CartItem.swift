//
//  CartItem.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

import SwiftUI

struct CartItem: View {
    @State var item: CartItemModel = .init()
    
    var body: some View {
        HStack(spacing: 12) {
            Image(item.image)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 16, weight: .semibold))
                
                Text("Цена: \(item.price.formatted(.currency(code: "RUB"))), Размер: \(item.size)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Блок с количеством
            HStack(alignment: .center, spacing: 8) {
                Button {
                    if item.count > 1 {
                        item.count -= 1
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 28, height: 28)
                        Image(systemName: "minus")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
                
                Text("\(item.count)")
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 28)
                
                Button {
                    item.count += 1
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 28, height: 28)
                        Image(systemName: "plus")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CartItemModel {
    let image: String
    let name: String
    let price: Int
    let size: String
    var count: Int
    
    init(image: String = "hand",
         name: String = "Шелковая блузка",
         price: Int = 7280,
         size: String = "S",
         count: Int = 1
    ) {
        self.image = image
        self.name = name
        self.price = price
        self.size = size
        self.count = count
    }
}

#Preview {
    CartItem()
}
