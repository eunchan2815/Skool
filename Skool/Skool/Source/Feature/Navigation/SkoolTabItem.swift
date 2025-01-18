//
//  SkoolTabItem.swift
//  Skool
//
//  Created by dgsw30 on 1/17/25.
//

import SwiftUI

struct SkoolTabItem: View {
    let item: TabType
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        ZStack {
            if isSelected {
                Rectangle()
                    .fill(Color.main)
                    .frame(width: 65, height: 60)
                    .cornerRadius(14)
            }
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(width: 50, height: 25)
                    
                    Image(isSelected ? item.click : item.image)
                        .resizable()
                        .frame(
                            width: item == TabType.seat ? 50 : 24,
                            height: item == TabType.seat ? 25 : 24
                        )
                        .scaledToFit()
                }
                Text(item.text)
                    .foregroundStyle(isSelected ? .white : .black)
                    .font(.custom("Pretendard-Regular", size: 14))
                    .padding(.vertical, 2)
            }
            .onTapGesture {
                withAnimation(.easeIn(duration: 0.1)) {
                    action()
                }
            }
        }
    }
}
