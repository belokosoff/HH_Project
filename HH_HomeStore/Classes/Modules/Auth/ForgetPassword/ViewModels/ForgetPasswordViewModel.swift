// Created by Maxim Belokosov.
//

import Foundation

class ForgetPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var errorMessage: String?

    func validateEmail() -> Bool {
        !email.isEmpty
    }

    func sendResetEmail() {
        errorMessage = nil
    }
}
