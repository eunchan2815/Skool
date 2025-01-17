//
//  SettingButton.swift
//  Skool
//
//  Created by dgsw30 on 1/17/25.
//

import SwiftUI

struct SettingButton: View {
    enum button {
        case call
        case notion
        
        var role: String {
            switch self {
            case .call:
                "문의하기"
            case .notion:
                "개인정보 처리방침"
            }
        }
        
        var image: Image {
            switch self {
            case .call:
                Image(icon: .headset)
            case .notion:
                Image(icon: .key)
            }
        }
    }
    
    
    @State var selectedButton: button
    @Environment(\.openURL) private var openURL
    let link: String
    var body: some View {
        Button {
            if let url = URL(string: link) {
                openURL(url)
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.main)
                    .frame(width: 362, height: 67)
                HStack {
                    selectedButton.image
                        .resizable()
                        .frame(width: 26, height: 26)
                        .padding(.trailing, 10)
                    
                    Text(selectedButton.role)
                        .foregroundStyle(.white)
                        .font(.krMedium(15))
                    Spacer()
                }
                .padding(.leading, 35)
            }
        }
    }
}
