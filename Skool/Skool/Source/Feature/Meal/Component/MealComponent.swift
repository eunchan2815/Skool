import SwiftUI

struct MealComponent: View {
    let mealType: String
    let meal: Meal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(mealType)
                    .font(.krMedium(18))
                    .foregroundStyle(.white)
                    .frame(width: 50, height: 30)
                    .background(Color.main)
                    .cornerRadius(15)
                    .padding(.top, 10)
                Spacer()
                Text(meal.calorieInfo)
                    .font(.regular(14))
            }
            .padding(.horizontal, 15)
            
            Text(meal.cleanedText)
                .font(.krRegular(15))
                .padding(.horizontal, 24)
                .padding(.bottom, 15)
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.sub2)
        )
        .padding(.horizontal)
    }
}
