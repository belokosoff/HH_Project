// Created by Maxim Belokosov.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            Image("category_not_found")
                .frame(height: 201)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(spacing: 8) {
                Text("Нет доступных товаров").bold().font(.system(size: 18))
                Text("Пожалуйста, попробуйте ещё раз").font(.system(size: 14))

                Button(action: {}) {
                    Text("Обновить")
                        .foregroundStyle(.black)
                }.frame(width: 106, height: 40)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.top, 24)
            }.padding()
        }
    }
}

#Preview {
    CategoryView()
}
