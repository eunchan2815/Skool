//
//  AddBackButtonViewModifier.swift
//  Skool
//
//  Created by dgsw30 on 12/30/24.
//


import SwiftUI

struct AddSkoolBackButton: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.regular(20))
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
    }
}

extension View {
    func SkoolBackButton(
    ) -> some View {
        self.modifier(AddSkoolBackButton())
    }
}
