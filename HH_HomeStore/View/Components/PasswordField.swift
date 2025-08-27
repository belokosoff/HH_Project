//
//  PasswordField.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//
import SwiftUI

struct PasswordField: View {
    
    let placeholder: String
    @State var isSecure: Bool = true
    @Binding var text: String
    @Binding var errorMessage: String?
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .trailing) {
                if isSecure {
                    SecureField(text: $text) {
                        Text(placeholder)
                            .foregroundStyle(Color.gray)
                            .font(.system(size: 16))
                    }
                    .padding(16)
                    .frame(height: 58)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
                } else {
                    TextField(text: $text) {
                        Text(placeholder)
                            .foregroundStyle(Color.gray)
                    }
                    .padding(16)
                    .frame(height: 58)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
                }
                
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: "eye")
                        .foregroundStyle(Color.gray)
                }
                .padding(.trailing, 16)
            }
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
    PasswordField(placeholder: "placeholder", isSecure: true, text: .constant(""), errorMessage: .constant("")).padding()
}
