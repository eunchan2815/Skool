//
//  MealComponent.swift
//  Skool
//
//  Created by dgsw30 on 12/24/24.
//

import SwiftUI

struct MealComponent: View {
    let mealType: String
    let meal: Meal
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(.sub)
            .frame(width: 345, height: 200)
            .overlay {
                VStack {
                    HStack {
                        Text(mealType)
                            .font(.bold(18))
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 30)
                            .background(Color.main)
                            .cornerRadius(15)
                        Spacer()
                    }
                    .padding(.leading, 15)
                    .padding(.bottom, 4)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(meal.formattedDescription)
                                .font(.regular(16))
                        }
                        Spacer()
                    }
                    .padding(.leading, 40)
                }
            }
    }
}
