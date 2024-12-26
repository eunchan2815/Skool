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
            SelectDateView()
            ScrollView {
                if let meals = mealVM.breakfastMeals.first {
                    MealComponent(mealType: "조식", meal: meals)
                }
                if let meals = mealVM.lunchMeals.first {
                    MealComponent(mealType: "중식", meal: meals)
                }
                if let meals = mealVM.dinnerMeals.first {
                    MealComponent(mealType: "석식", meal: meals)
                }
            }
            .padding(.vertical, 12)
        }
        Spacer()
        .onAppear {
            mealVM.getMeal(date: "20241226")
        }
        
    }
}

#Preview {
    MealView()
}
