// Created by Maxim Belokosov.
//

import SwiftUI

struct TabBarButton: View {
    let index: Int
    let isSelected: Bool
    let action: () -> Void
    let activeImage: String
    let inactiveImage: String
    let title: String

    var body: some View {
        Button(action: action) {
            VStack(alignment: .center, spacing: 4) {
                Image(isSelected ? activeImage : inactiveImage)
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(isSelected ? .black : .gray)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
