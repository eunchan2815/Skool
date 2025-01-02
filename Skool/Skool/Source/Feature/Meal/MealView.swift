//
//  MealView.swift
//  Skool
//
//  Created by dgsw30 on 12/23/24.
//

import SwiftUI

struct MealView: View {
    @StateObject private var mealVM = MealViewModel()
    @State private var selectedDateIndex: Int? = nil
    @State private var date = ["SON", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    private var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("December 2024")
                    .foregroundStyle(.main)
                    .font(.krSemiBold(28))
                Spacer()
            }
            .padding()
            HStack {
                ForEach(date, id: \.self) { date in
                    HStack {
                        Text("\(date)")
                            .font(.krLight(14))
                            .foregroundStyle(.main)
                            .padding(.leading, 14)
                    }
                    Spacer()
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1..<31, id: \.self) { number in
                        Button {
                            selectedDateIndex = number
                        } label: {
                            Text("\(number)")
                                .frame(width: 60, height: 60)
                                .background(selectedDateIndex == number ? Color.main : Color.gray)
                                .foregroundStyle(.white)
                                .cornerRadius(50)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 10)
                Divider()
                    .padding()
            }
            
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
            ScrollView(showsIndicators: false) {
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
        }
        .onAppear {
            mealVM.getMeal(date: "20241209")
        }
    }
}


#Preview {
    MealView()
}
