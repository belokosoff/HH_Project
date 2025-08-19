//
//  SizeButton.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct SizeButton: View {
    let size: String
    let selected: Bool

    var body: some View {
        Text(size)
            .font(.system(size: 14, weight: selected ? .medium : .regular))
            .foregroundColor(selected ? .white : .black)
            .frame(width: 41, height: 32)
            .background(selected ? Color.black : Color.gray.opacity(0.1))
            .cornerRadius(12)
            .padding(.vertical, 4)
    }
}
