//
//  SettingView.swift
//  Skool
//
//  Created by dgsw30 on 1/17/25.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.openURL) private var openURL
    var body: some View {
        VStack {
            HStack {
                Text("설정")
                    .font(.bold(30))
                Spacer()
            }
            .padding()
            HStack {
                Text("안녕하세요 김은찬님")
                    .font(.krMedium(20))
                Spacer()
            }
            .padding()
            VStack {
                SettingSchool()
                
                SettingButton(selectedButton: .call, link: "https://succinct-breakfast-604.notion.site/177cba4137ad80c78dd7e91a19d7f19e")
                SettingButton(selectedButton: .notion, link: "https://www.youtube.com/watch?v=OrrZ-TiTbPg&list=RDIde2nawCz4Y&index=21")
            }
            Spacer()
        }
    }
}

#Preview {
    SettingView()
}
