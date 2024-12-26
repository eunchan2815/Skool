import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var breakfastMeals: [Meal] = [] // MARK: 조식
    @Published var lunchMeals: [Meal] = [] // MARK: 중식
    @Published var dinnerMeals: [Meal] = [] // MARK: 석식
    
    func getMeal(date: String) {
        let parameters: [String: String] = [
            "Type": "json",
            "ATPT_OFCDC_SC_CODE": "D10",
            "SD_SCHUL_CODE": "7240454",
            "KEY": "\(String(describing: apiKey))",
            "MLSV_YMD": date
        ]
        
        SkoolNetworkRunner.shared.request(method: .get, parameters: parameters, response: MealResponse.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    if let mealInfo = data.mealServiceDietInfo?[safe: 1]?.row {
                        self.meals = mealInfo
                        self.filterMeals()
                    }
                }
            case .failure(let error):
                print("에러 발생: \(error.localizedDescription)")
            }
        }
    }
    
    private func filterMeals() {
        var breakfast: [Meal] = []
        var lunch: [Meal] = []
        var dinner: [Meal] = []
        
        for meal in meals {
            switch meal.mealTypeName {
            case "조식":
                breakfast.append(meal)
            case "중식":
                lunch.append(meal)
            case "석식":
                dinner.append(meal)
            default:
                print("error")
                break
            }
        }
        
        self.breakfastMeals = breakfast
        self.lunchMeals = lunch
        self.dinnerMeals = dinner
    }
}
