//
//  SettingRectangle.swift
//  Skool
//
//  Created by dgsw30 on 1/17/25.
//

import SwiftUI

struct SettingSchool: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.main)
                .frame(width: 362, height: 103)
            VStack(alignment: .leading) {
                HStack {
                    Image(icon: .schoolhat)
                        .resizable()
                        .frame(width: 24, height: 24)
                    Spacer()
                }
                
                Text("1학년 2반")
                    .foregroundStyle(.white)
                    .font(.krMedium(15))
                
                Text("대구소프트웨어마이스터고등학교")
                    .foregroundStyle(.white)
                    .font(.krMedium(15))
            }
            .padding(.top)
            .padding(.bottom, 18)
            .padding(.leading, 40)
        }
    }
}

#Preview {
    SettingSchool()
}
