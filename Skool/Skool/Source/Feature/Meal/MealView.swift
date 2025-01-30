//
//  MealView.swift
//  Skool
//
//  Created by dgsw30 on 12/23/24.
//

import SwiftUI

struct MealView: View {
    @StateObject private var mealVM = MealViewModel()
    @StateObject private var date = DateViewModel()
    
    var body: some View {
        VStack {
            HeaderView(date: date)
                .padding(.bottom, 14)
            VStack {
                if mealVM.notFound {
                    Spacer()
                    Image(icon: .mealNotFound)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("급식이 없어요!")
                        .font(.krMedium(16))
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
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
                .padding(.vertical)
            }
            .SkoolView()
            .onAppear {
                mealVM.getMeal(date: date.cleanDate())
            }
            .onChange(of: date.currentDate) { newDate, oldValue in
                mealVM.getMeal(date: date.cleanDate())
            }
            
        }
    }
}

#Preview {
    MealView()
}
