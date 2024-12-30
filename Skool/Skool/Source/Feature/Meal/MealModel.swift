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
    let regionCode: String
    let regionName: String
    let schoolCode: String
    let schoolName: String
    let mealTypeCode: String
    let mealTypeName: String
    let mealDescription: String
    let mealAmount: Double
    let ingredientInfo: String
    let calorieInfo: String
    let nutritionInfo: String
    let loadDate: String
    
    var formattedDescription: String {
        return mealDescription.replacingOccurrences(of: "<br/>", with: "\n")
    }
    
    var cleanedText : String {
        let pattern = "\\([^)]*\\)"
        return formattedDescription.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }
    
    
    enum CodingKeys: String, CodingKey {
        case mealToDate = "MLSV_TO_YMD"
        case mealFromDate = "MLSV_FROM_YMD"
        case mealDate = "MLSV_YMD"
        case regionCode = "ATPT_OFCDC_SC_CODE"
        case regionName = "ATPT_OFCDC_SC_NM"
        case schoolCode = "SD_SCHUL_CODE"
        case schoolName = "SCHUL_NM"
        case mealTypeCode = "MMEAL_SC_CODE"
        case mealTypeName = "MMEAL_SC_NM"
        case mealDescription = "DDISH_NM"
        case mealAmount = "MLSV_FGR"
        case ingredientInfo = "ORPLC_INFO"
        case calorieInfo = "CAL_INFO"
        case nutritionInfo = "NTR_INFO"
        case loadDate = "LOAD_DTM"
    }
}
