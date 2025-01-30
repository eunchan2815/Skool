//
//  SignupTextFieldBar.swift
//  Skool
//
//  Created by dgsw30 on 1/31/25.
//

import SwiftUI

struct SignupTextFieldBar: View {
    @State var signupEnum: SignupEnum
    @Binding var bindingText: String
    let boolean: Bool
    var body: some View {
        VStack {
            HStack {
                Text(signupEnum.signupText)
                    .font(.regular(20))
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.vertical, 2)
            if signupEnum == .password {
                SignupTextfield(inputText: "비밀번호를 7자 이내로 입력해주세요.", text: $bindingText, boolean: boolean)
            } else {
                SignupTextfield(inputText: "\(signupEnum.signupText)을 입력해주세요.", text: $bindingText, boolean: boolean)
            }
        }
    }
}
