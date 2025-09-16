// Created by Maxim Belokosov.
//

import SwiftUI

struct SizeButton: View {
    let size: String
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected = true
        }) {
            Text(size)
                .font(.system(size: 14, weight: isSelected ? .medium : .regular))
                .foregroundColor(isSelected ? .white : .black)
                .frame(width: 41, height: 32)
                .background(isSelected ? Color.black : Color.gray.opacity(0.1))
                .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
