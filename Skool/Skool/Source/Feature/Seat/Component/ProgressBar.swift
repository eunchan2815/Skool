//
//  ProgressBar.swift
//  Skool
//
//  Created by dgsw30 on 12/30/24.
//


import SwiftUI

struct ProgressBar: View {
    enum ProgressColor {
        case one
        case two
        
        var fillcolor: Int {
            switch self {
            case .one:
                return 1
            case .two:
                return 2
            }
        }
    }
    var progress: ProgressColor
    var body: some View {
        HStack {
            ForEach(0..<2) { index in
                Circle()
                    .fill(index < progress.fillcolor ? Color.sub1 : Color.sub2)
                    .frame(width: 8, height: 8)
            }
        }
    }
}
