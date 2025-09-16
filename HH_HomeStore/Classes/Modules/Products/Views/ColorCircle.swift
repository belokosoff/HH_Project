// Created by Maxim Belokosov.
//

import SwiftUI

struct ColorCircle: View {
    let color: ColorOption
    let isSelected: Bool
    let onTap: () -> Void

    var body: some View {
        Button(action: {
            onTap()
        }) {
            Circle()
                .fill(Color(hex: color.hex))
                .frame(width: 32, height: 32)
                .overlay(
                    Circle()
                        .stroke(
                            isSelected ? Color.black : Color.gray.opacity(0.3),
                            lineWidth: isSelected ? 3 : 1
                        )
                )
        }
        .buttonStyle(.plain)
    }
}
