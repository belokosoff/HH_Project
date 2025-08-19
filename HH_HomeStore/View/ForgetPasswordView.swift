//
//  ForgetPasswordView.swift
//  HH_HomeStore
//
//  Created by Maxim Belokosov on 17.08.2025.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                Text("Забыли пароль?")
                    .font(.system(size: 22))
                    .bold()
                
                Spacer()
                
                Color.clear
                    .frame(width: 44, height: 44)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            
            VStack(spacing: 32) {
                InputFields(placeholder: "Электронная почта", text: $email)
                
                StyledButton(title: "Восстановить пароль") {
                    // action
                }
            }
            .padding(16)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    ForgetPasswordView()
}
