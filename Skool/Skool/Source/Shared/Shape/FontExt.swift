//
//  SkoolFont.swift
//  Skool
//
//  Created by dgsw30 on 12/23/24.
//
import SwiftUI

enum PretendardWeight: String {
    case bold = "Pretendard-Bold"
    case semibold = "Pretendard-SemiBold"
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case light = "Pretendard-Light"
    case krBold = "NotoSansKR-Bold"
    case krSemiBold = "NotoSansKR-SemiBold"
    case krLight = "NotoSansKR-Light"
    case krMedium = "NotoSansKR-Medium"
    case krRegular = "NotoSansKR-Regular"
}

extension Font {
    private static func pretendard(weight: PretendardWeight, size: CGFloat) -> Self {
        Font.custom(weight.rawValue, size: size)
    }
    
    static func bold(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .bold, size: size)
    }
    
    static func semibold(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .semibold, size: size)
    }
    
    static func regular(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .regular, size: size)
    }
    
    static func medium(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .medium, size: size)
    }
    
    static func light(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .light, size: size)
    }
    
    static func krBold(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .krBold, size: size)
    }
    
    static func krSemiBold(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .krSemiBold, size: size)
    }
    static func krLight(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .krLight, size: size)
    }
    static func krMedium(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .krMedium, size: size)
    }
    static func krRegular(_ size: CGFloat) -> Self {
        Font.pretendard(weight: .krRegular, size: size)
    }
}
