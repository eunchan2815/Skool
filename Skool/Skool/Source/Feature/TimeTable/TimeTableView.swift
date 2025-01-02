//
//  TimeTableView.swift
//  Skool
//
//  Created by dgsw30 on 12/23/24.
//

import SwiftUI

struct TimeTableView: View {
    @StateObject private var timeTableVM = TimeTableViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(timeTableVM.timeTable, id: \.self) { timeTable in
                    TimeTableComponent(timetable: timeTable)
                }
            }
        }
            .onAppear {
                timeTableVM.fetchTimeTable(date: "20241209")
            }
            .SkoolView()
    }
}

#Preview {
    TimeTableView()
}
