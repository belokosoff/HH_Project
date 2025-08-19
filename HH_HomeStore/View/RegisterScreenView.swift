//
//  RegisterScreenView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 18.08.2025.
//

import SwiftUI

struct RegisterScreenView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Spacer()
                Image(systemName: "xmark")
            }
            
            HStack(alignment: .bottom) {
                Text("Регистрация")
                    .bold()
                    .font(.system(size: 22))
                Spacer()
            }
            
            VStack(spacing: 30) {
                InputFields(placeholder: "Имя Фамилия", text: $name)
                InputFields(placeholder: "Электронная почта", text: $email)
                PasswordField(placeholder: "Пароль", text: $password)
                PasswordField(placeholder: "Подтвердите пароль", text: $confirmPassword)
            }
            
            Spacer()
            
            StyledButton(title: "Зарегистрироваться") {
            }
        }
        .padding(16)
    }
}

#Preview {
    RegisterScreenView()
}
