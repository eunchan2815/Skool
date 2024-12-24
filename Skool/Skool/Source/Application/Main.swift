//
//  ContentView.swift
//  Skool
//
//  Created by dgsw30 on 11/22/24.
//

import SwiftUI

struct Main: View {
    @State private var selectTab: TabType = .meal
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Spacer()
            switch selectTab {
            case .meal:
                MealView()
            case .timeTable:
                TimeTableView()
            case .seat:
                SeatView()
            }
            SkoolTabBar(selectedTab: $selectTab)
        }
    }
}

#Preview {
    Main()
}
