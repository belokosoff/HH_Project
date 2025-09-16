// Created by Maxim Belokosov.
//

import SwiftUI

struct ForgetPasswordView: View {
    // MARK: Lifecycle

    init(viewModel: ForgetPasswordViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Internal

    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
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
                    InputFields(placeholder: "Электронная почта", text: $email, errorMessage: $errorMessage)

                    StyledButton(title: "Восстановить пароль") {
                        viewModel.sendResetEmail()
                    }
                }
                .padding(16)

                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    // MARK: Private

    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var viewModel: ForgetPasswordViewModel
    @State private var email: String = ""
    @State private var errorMessage: String?
}

#Preview {
    ForgetPasswordView(viewModel: ForgetPasswordViewModel())
}
