//
//  signupEnum.swift
//  Skool
//
//  Created by dgsw30 on 1/31/25.
//


enum SignupEnum: String {
    case name
    case email
    case password
    case grade
    case classNum
    
    var signupText: String {
        switch self {
        case .name:
            return "이름"
        case .email:
            return "이메일"
        case .password:
            return "비밀번호"
        case .grade:
            return "학년"
        case .classNum:
            return "반"
        }
    }
}
