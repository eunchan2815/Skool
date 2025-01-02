import Foundation

struct MealResponse: Codable {
    let mealServiceDietInfo: [MealServiceDietInfo]?
}

struct MealServiceDietInfo: Codable {
    let head: [DietInfoHeader]?
    let row: [Meal]?
}

struct DietInfoHeader: Codable {
    let listTotalCount: Int?
    let result: ResponseResult?
    
    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
    }
}

struct ResponseResult: Codable {
    let code: String?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

struct Meal: Codable {
    let mealToDate: String
    let mealFromDate: String
    let mealDate: String
    let schoolCode: String
    let schoolName: String
    let mealTypeName: String
    let mealDescription: String?
    let ingredientInfo: String?
    let calorieInfo: String?
    
    var cleanDescription: String {
        let formatted = mealDescription?.replacingOccurrences(of: "<br/>", with: "\n") ?? ""
        return formatted.replacingOccurrences(of: "*", with: "")
    }
    
    var cleanedText : String {
        let pattern = "\\([^)]*\\)"
        return cleanDescription.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }
    
    var cleanCalorieInfo: String {
        if let calorieString = calorieInfo?.replacingOccurrences(of: " Kcal", with: ""),
           let calorie = Double(calorieString) {
            return String(Int(calorie))
        } else {
            return "Not Found"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case mealToDate = "MLSV_TO_YMD"
        case mealFromDate = "MLSV_FROM_YMD"
        case mealDate = "MLSV_YMD"
        case schoolCode = "SD_SCHUL_CODE"
        case schoolName = "SCHUL_NM"
        case mealTypeName = "MMEAL_SC_NM"
        case mealDescription = "DDISH_NM"
        case ingredientInfo = "INGR_INFO"
        case calorieInfo = "CAL_INFO"
    }
}

