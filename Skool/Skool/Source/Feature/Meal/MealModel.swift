//
//  MealModel.swift
//  Skool
//
//  Created by dgsw30 on 12/24/24.
//

import Foundation

struct MealModel: Codable {
    let mealDietInfo: [MealDietInfo]
}

struct MealDietInfo: Codable {
    let header: [DietInfoHeader]?
    let meals: [Meal]?
}

struct DietInfoHeader: Codable {
    let totalCount: Int?
    let result: ResponseResult?
}

struct ResponseResult: Codable {
    let code: String
    let message: String
}

struct Meal: Codable {
    let regionCode, regionName, schoolCode, schoolName: String
    let mealTypeCode, mealTypeName, mealDate: String
    let mealAmount: Double 
    let mealDescription, ingredientInfo, calorieInfo, nutritionInfo: String
    let mealFromDate, mealToDate, loadDate: String
}
