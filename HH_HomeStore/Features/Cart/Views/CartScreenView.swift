//
//  CartScreenView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 17.08.2025.
//

import SwiftUI

struct CartScreenView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                Button(action: {}) {
                    Text("Очистить")
                        .foregroundStyle(Color.red)
                        .font(.system(size: 12))
                }
            }
            ScrollView(.vertical, showsIndicators: false){
               ForEach(0..<10, id: \.self) { _ in
                    CartItemView()
                }
            }.background(Color.white)
                .padding(.vertical, 8)
            StyledButton(title: "Оформить заказ")
        }.padding(16)
    }
}

#Preview {
    CartScreenView()
}

