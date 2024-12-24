//
//  MealViewModel.swift
//  Skool
//
//  Created by dgsw30 on 12/24/24.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var meals: [MealModel] = []
    
    func getMeal(date: String) {
        let parameters: [String: String] = [
            "ATPT_OFCDC_SC_CODE": "D10",
            "SD_SCHUL_CODE": "7240454",
            "KEY": "\(String(describing: apiKey))",
            "MLSV_YMD": date,
            "&type": "json"
        ]
        
        SkoolNetworkRunner.shared.request(method: .post, parameters: parameters, response: [MealModel].self) { result in
            switch result {
            case .success(let data):
                self.meals = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

