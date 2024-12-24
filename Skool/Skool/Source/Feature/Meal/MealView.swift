//
//  MealView.swift
//  Skool
//
//  Created by dgsw30 on 12/23/24.
//

import SwiftUI

struct MealView: View {
    @StateObject private var mealVM = MealViewModel()
    var body: some View {
        VStack {
            Text("meal")
        }
        .onAppear {
            mealVM.getMeal(date: "20241223")
        }
    }
}

#Preview {
    MealView()
}
