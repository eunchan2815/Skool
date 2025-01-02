//
//  Corneradius.swift
//  Skool
//
//  Created by dgsw30 on 1/2/25.
//

import SwiftUI

//TODO: 프로필 corneradius
public extension View {
    func cornerRadius(_ radius: CGFloat, corners: RoundedCornerShape.RectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
}
