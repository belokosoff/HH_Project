//
//  ForgetPasswordVM.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 17.08.2025.
//

import Foundation

class ForgetPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var errorMessage: String?
    
    func validateEmail() -> Bool {
        return !email.isEmpty
    }
    
    func sendResetEmail() {
        
        errorMessage = nil
    }
}
