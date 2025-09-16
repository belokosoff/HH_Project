// Created by Maxim Belokosov.
//

import SwiftUI

struct CheckoutItemView: View {
    var body: some View {
        HStack {
            Image("product")
                .frame(width: 58, height: 58)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment:) {
                Text("")
                    .font(.system(size: 16, weight: .bold))
                Text("")
                    .font(.system(size: 14, weight: .regular))
            }
        }
        .padding(16)
    }
}

#Preview {
    CheckoutItemView()
}
