//
//  TimeTableComponent.swift
//  Skool
//
//  Created by dgsw30 on 1/2/25.
//

import SwiftUI

struct TimeTableComponent: View {
    let timetable: TimeTableEntry
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 14)
                .fill(.sub2)
                .frame(width: 345, height: 80)
                .overlay {
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(.sub1)
                                .frame(width: 57, height: 80)
                                .cornerRadius(14, corners: [.topLeft, .bottomLeft])
                            Text(timetable.perio)
                                .foregroundStyle(.white)
                                .font(.krRegular(20))
                        }
                        Text(timetable.formattedItrtCntnt)
                            .font(.krMedium(17))
                            .padding()
                        Spacer()
                    }
                }
        }
    }
}
