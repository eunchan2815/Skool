//
//  SettingView.swift
//  Skool
//
//  Created by dgsw30 on 1/17/25.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.openURL) private var openURL
    @StateObject private var authVM = LoginViewModel()
    var body: some View {
        VStack {
            HStack {
                Text("설정")
                    .font(.bold(30))
                Spacer()
            }
            .padding()
            HStack {
                Text("안녕하세요 \(authVM.userName)님")
                    .font(.krMedium(20))
                Spacer()
            }
            .padding()
            VStack {
                SettingSchool(grade: authVM.grade, classNum: authVM.classNum)
                
                SettingButton(selectedButton: .call, link: "https://succinct-breakfast-604.notion.site/177cba4137ad80c78dd7e91a19d7f19e")
                SettingButton(selectedButton: .notion, link: "https://www.youtube.com/watch?v=OrrZ-TiTbPg&list=RDIde2nawCz4Y&index=21")
            }
            HStack {
                Spacer()
                Button {
                    authVM.logout()
                } label: {
                    Text("로그아웃")
                        .underline()
                        .font(.medium(15))
                        .foregroundStyle(Color.red)
                }
            }
            .padding(.vertical, 4)
            .padding(.trailing, 30)
            
            Spacer()
        }
    }
}

#Preview {
    SettingView()
}
