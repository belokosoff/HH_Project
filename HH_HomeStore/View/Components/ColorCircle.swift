//
//  ColorCircle.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct ColorCircle: View {
    let color: Color
    let selected: Bool

    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 32, height: 32)
            .overlay(
                Circle().stroke(selected ? color : Color.gray.opacity(0.3), lineWidth: 2)
            )
    }
}
