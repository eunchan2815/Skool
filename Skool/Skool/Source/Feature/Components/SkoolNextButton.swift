//
//  SkoolNextButton.swift
//  Skool
//
//  Created by dgsw30 on 1/30/25.
//

import SwiftUI

struct SkoolNextButtonBuilder: ViewModifier {
    @State var text: AuthEnum
    let bool: Bool
    let action: () -> Void
    func body(content: Content) -> some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(bool ? Color.init(uiColor: .systemGray4) : .sub1)
                .frame(width: text == AuthEnum.signup  ? 345 : 313, height: 55)
                .overlay {
                    Text(text.authText)
                        .foregroundStyle(.white)
                        .font(.medium(19))
                }
        }
        .disabled(bool)
    }
}

extension View {
    func SkoolNextButton(text: AuthEnum, bool: Bool, action: @escaping () -> Void) -> some View {
        self.modifier(SkoolNextButtonBuilder(text: text, bool: bool, action: action))
    }
}
