// Created by Maxim Belokosov.
//

import SwiftUI

// MARK: - AuthScreenView

struct AuthScreenView: View {
    // MARK: Internal

    @ObservedObject var vm = AuthViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Image("gradient")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 320)
                    .ignoresSafeArea(edges: .top)

                VStack(spacing: 28) {
                    Text("Home store")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    InputFields(placeholder: "Логин", text: $vm.username, errorMessage: $vm.usernameError)
                    PasswordField(placeholder: "Пароль", text: $vm.password, errorMessage: $vm.passwordError)

                    StyledButton(title: "Войти") {
                        vm.login()
                    }

                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Text("Забыли пароль?")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.white)
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresented) {
            ForgetPasswordView(viewModel: ForgetPasswordViewModel())
        }
    }

    // MARK: Private

    @State private var isPresented: Bool = false
}

#Preview {
    AuthScreenView()
}
