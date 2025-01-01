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
        Text("TimeTable")
            .onAppear {
                timeTableVM.fetchTimeTable(date: "20241209")
            }
    }
}

#Preview {
    TimeTableView()
}
