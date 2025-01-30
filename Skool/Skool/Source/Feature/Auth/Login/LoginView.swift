//
//  LoginView.swift
//  Skool
//
//  Created by dgsw30 on 1/30/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 174, height: 63)
                
                Text("급식 시간표 자리뽑기 스클로 해결!")
                    .font(.medium(16))
                    .padding(.vertical, 2)
                
                VStack {
                    SkoolTextField(image: .profile, inputText: "이메일을 입력해주세요.", bindingText: $loginVM.email)
                    SkoolSecureField(image: .password, inputText: "비밀번호를 입력해주세요.", postText: $loginVM.password)
                }
                .padding(.top, 80)
                
                SkoolNextButton(text: .login, bool: loginVM.isFormValid, action: {
                    loginVM.login()
                })
                .padding(.top, 40)
                
                HStack {
                    Spacer()
                    Text("계정이 없으신가요?")
                        .font(.caption2)
                        .foregroundColor(.init(uiColor: .systemGray2))
                        .font(.regular(13))
                    NavigationLink {
                        SignupView()
                    } label: {
                        Text("회원가입")
                            .font(.caption2)
                            .foregroundStyle(.main)
                            .font(.regular(13))
                    }
                }
                .padding(.trailing, 52)
                .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    LoginView()
}
