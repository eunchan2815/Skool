//
//  authEnum.swift
//  Skool
//
//  Created by dgsw30 on 1/31/25.
//


enum AuthEnum: String {
    case login
    case signup
    
    var authText: String {
        switch self {
        case .login:
            return "로그인"
        case .signup:
            return "회원가입"
        }
    }
}
