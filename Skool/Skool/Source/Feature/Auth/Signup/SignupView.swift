import SwiftUI
import Firebase

struct SignupView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var signupVM = SignupViewModel()
    @State private var navigate = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(" 회원가입을 위해\n 정보를 입력해주세요!")
                        .font(.regular(20))
                    Spacer()
                }
                .padding(.leading, 25)
            }
            
            VStack {
                SignupTextFieldBar(signupEnum: .name, bindingText: $signupVM.username, boolean: signupVM.usernameVaild)
                SignupTextFieldBar(signupEnum: .email, bindingText: $signupVM.email, boolean: signupVM.emailValid)
                SignupTextFieldBar(signupEnum: .password, bindingText: $signupVM.password, boolean: signupVM.passwordValid)
                SignupTextFieldBar(signupEnum: .grade, bindingText: $signupVM.grade, boolean: signupVM.gradeValid)
                SignupTextFieldBar(signupEnum: .classNum, bindingText: $signupVM.classNum, boolean: signupVM.classNumValid)
            }
            Spacer()
            SkoolNextButton(text: .signup, bool: signupVM.allValid) {
                signupVM.signup()
            }
                .padding(.top, 30)
                .alert("회원가입", isPresented: $signupVM.signupSuccess) {
                    Button {
                        dismiss()
                    } label: {
                        Text("OK")
                    }
                } message: {
                    Text("회원가입이 완료되었습니다.")
                }
                .navigationDestination(isPresented: $navigate) {
                    LoginView()
                }
        }
        .SkoolBackButton()
    }
}

#Preview {
    SignupView()
}
