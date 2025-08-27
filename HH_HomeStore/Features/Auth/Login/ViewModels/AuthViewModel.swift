//
//  AuthViewModels.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 26.08.2025.
//

import Foundation

final class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""

    @Published var usernameError: String?
    @Published var passwordError: String?

    @Published var isLoggedIn: Bool = false

    var isFormValid: Bool {
        usernameError == nil && passwordError == nil && !username.isEmpty && !password.isEmpty
    }

    func validateFields() {
        usernameError = username.isEmpty || username.allSatisfy({ $0.isWhitespace })
            ? "Поле не может быть пустым"
            : nil

        passwordError = password.isEmpty || password.allSatisfy({ $0.isWhitespace })
            ? "Поле не может быть пустым"
            : nil
    }

    func login() {
        validateFields()
        guard isFormValid else { return }
        isLoggedIn = true
    }
}
