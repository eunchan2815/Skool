//
//  ContentView.swift
//  Skool
//
//  Created by dgsw30 on 11/22/24.
//

import SwiftUI

struct Main: View {
    @State private var selectTab: TabType = .meal
    
    var body: some View {
        SkoolTabBar(selection: $selectTab) {
            switch selectTab {
            case .meal:
                MealView()
            case .timeTable:
                TimeTableView()
            case .seat:
                InputSeat()
            case .setting:
                SettingView()
            }
        }
        .padding(.top)
    }
}

#Preview {
    Main()
}
