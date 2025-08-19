//
//  SearchField.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 19.08.2025.
//

import SwiftUI

struct SearchField: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 12)
            
            TextField("Search", text: $text)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 12)
                .padding(.horizontal, 4)
        }
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .frame(height: 72)
    }
}

#Preview {
    SearchField(text: .constant(""))
}
