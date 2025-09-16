// Created by Maxim Belokosov.
//

import SwiftUI

struct PaymentMethodPicker: View {
    let method: String
    @Binding var selectedMethod: String?

    var body: some View {
        Button(action: {
            selectedMethod = method
        }) {
            HStack {
                Text(method)
                    .foregroundColor(.black)
                    .font(.body)
                    .fontWeight(.regular)

                Spacer()

                ZStack {
                    Circle()
                        .stroke(Color.black.opacity(selectedMethod == method ? 1 : 0.3), lineWidth: 2)
                        .frame(width: 24, height: 24)

                    if selectedMethod == method {
                        Circle()
                            .fill(Color.black)
                            .frame(width: 12, height: 12)
                    }
                }
            }
            .padding(16)
            .frame(height: 58)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    VStack(spacing: 16) {
        PaymentMethodPicker(method: "Кредитная карта", selectedMethod: .constant("Кредитная карта"))
        PaymentMethodPicker(method: "Apple Pay", selectedMethod: .constant(nil))
    }
    .padding()
}
