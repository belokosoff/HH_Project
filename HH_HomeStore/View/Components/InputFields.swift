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
    @Binding var errorMessage: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
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
            
            if let errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.system(size: 14))
                    .foregroundColor(.red)
                    .padding(.leading, 16)
            }
        }
    }
}

#Preview {
    InputFields(placeholder: "Email", text: .constant(""), errorMessage: .constant("Введите корректный email"))
        .padding(16)
}
