//
//  InputFields.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 17.08.2025.
//

import SwiftUI

struct InputFields: View {
    
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(text: $text) {
            Text(placeholder)
                .foregroundStyle(Color.gray)
                .font(.system(size: 16))
        }
        .padding(16)
        .frame(height: 56)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

#Preview {
    InputFields(placeholder: "Placeholder", text: .constant("")).padding(16)
}
