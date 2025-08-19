//
//  CategoryButton.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct CategoryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.black)
                .padding(.horizontal, 12)
                .frame(height: 32)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(12)
        }
    }
}

#Preview {
    CategoryButton(title: "Furniture") {
        print("Category tapped")
    }
}
