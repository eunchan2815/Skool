//
//  MealView.swift
//  Skool
//
//  Created by dgsw30 on 12/23/24.
//

import SwiftUI

struct MealView: View {
    @StateObject private var mealVM = MealViewModel()
    @State private var select = false
    
    var body: some View {
        VStack {
            HStack {
                Text("December 2024")
                    .foregroundStyle(.main)
                    .font(.krSemiBold(28))
                Spacer()
            }
            .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<10, id: \.self) { number in
                        Button {
                            select.toggle()
                        } label: {
                            Text("\(number)")
                                .frame(width: 70, height: 70)
                                .background(select ? Color.main : Color.gray)
                                .foregroundStyle(.white)
                                .cornerRadius(50)
                        }
                    }
                }
            }
            
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
        .onAppear {
            mealVM.getMeal(date: "20241226")
        }
    }
}


#Preview {
    MealView()
}
