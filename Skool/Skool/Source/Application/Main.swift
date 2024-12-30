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
        ZStack(alignment: .bottom) {
            Spacer()
            VStack(spacing: 0) {
                Spacer()
                switch selectTab {
                case .meal:
                    MealView()
                case .timeTable:
                    TimeTableView()
                case .seat:
                    InputSeat()
                }
                Spacer()
            }
            .padding(.bottom, 80)
            
            SkoolTabBar(selectedTab: $selectTab)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    Main()
}
