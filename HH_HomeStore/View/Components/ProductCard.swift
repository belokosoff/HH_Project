//
//  ProductCard.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI


struct ProductCard: View {
    var body: some View {
        NavigationLink(destination: ProductDetailView()) {
            VStack {
                Image("category_not_found")
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(height: 201)
                
                VStack(alignment: .leading) {
                    Text("Кроссовки Aero Knit")
                        .bold()
                    
                    HStack(spacing: 4) {
                        VStack(alignment: .leading) {
                            Text("★ 4.5 (1.2k) · Черный")
                                .foregroundStyle(.gray)
                            Text("11 610.00 руб")
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        
                        StyledButton(title: "Купить") {
                        }
                        .frame(width: 84, height: 32)
                    }
                }
                .padding(16)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ProductCard()
}
