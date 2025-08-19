import SwiftUI

struct AuthScreenView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                    
                    InputFields(placeholder: "Логин", text: $email)
                    PasswordField(placeholder: "Пароль", text: $password)
                    
                    StyledButton(title: "Войти") {
                        // действие входа
                    }
                    
                    NavigationLink {
                        ForgetPasswordView()
                    } label: {
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
    }
}

#Preview {
    AuthScreenView()
}
