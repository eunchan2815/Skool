//
//  UIHelper.swift
//  Skool
//
//  Created by dgsw30 on 1/3/25.
//

import Foundation
import SwiftUI

extension View {
    func hLeading()-> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing()-> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter()-> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
