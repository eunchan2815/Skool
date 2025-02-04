//
//  TimeTableView.swift
//  Skool
//
//  Created by dgsw30 on 12/23/24.
//

import SwiftUI

struct TimeTableView: View {
    @StateObject private var timeTableVM = TimeTableViewModel()
    @StateObject var date = DateViewModel()
    @StateObject private var userVM = LoginViewModel()
    var body: some View {
        VStack {
            HeaderView(date: date)
            if timeTableVM.notFount {
                VStack {
                    Spacer()
                    Image(icon: .timeTableNotFound)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("시간표가 없어요")
                        .font(.krMedium(16))
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                if !timeTableVM.notFount {
                    VStack {
                        ForEach(timeTableVM.timeTable, id: \.self) { timeTable in
                            TimeTableComponent(timetable: timeTable)
                        }
                    }
                }
            }
            .onAppear {
                timeTableVM.grade = userVM.grade
                timeTableVM.classNum = userVM.classNum
                timeTableVM.fetchTimeTable(date: date.cleanDate())
            }
            .onChange(of: date.currentDate) { newDate, oldValue in
                timeTableVM.fetchTimeTable(date: date.cleanDate())
            }
            .SkoolView()
        }
    }
}

#Preview {
    TimeTableView()
}
