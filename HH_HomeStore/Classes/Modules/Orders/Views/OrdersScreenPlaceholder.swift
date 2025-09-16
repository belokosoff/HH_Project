// Created by Maxim Belokosov.
//

import SwiftUI

struct OrdersScreenPlaceholder: View {
    var body: some View {
        VStack {
            Image("Bag_no_orders")
                .frame(height: 201)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .center, spacing: 10) {
                Text("У вас пока нет заказов")
                    .font(.system(size: 18))
                    .bold()
                Text("Начните покупки сегодня!")
                    .font(.system(size: 14))
            }
            .padding()

            Button {} label: {
                Text("Перейти к товарам")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 16)
            }
            .frame(height: 40)
            .background(.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
}

#Preview {
    OrdersScreenPlaceholder()
}
