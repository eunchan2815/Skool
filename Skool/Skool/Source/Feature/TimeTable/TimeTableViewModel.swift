//
//  TimeTableViewModel.swift
//  Skool
//
//  Created by dgsw30 on 1/1/25.
//

import Foundation

class TimeTableViewModel: ObservableObject {
    @Published var timeTable: [HisTimetable] = []
    
    
    func fetchTimeTable(date: String) {
        let parameters: [String: String] = [
            "Type": "json",
            "ATPT_OFCDC_SC_CODE": "D10",
            "SD_SCHUL_CODE": "7240454",
            "KEY": apiKey,
            "MLSV_YMD": date
        ]
        SkoolNetworkRunner.shared.request(url: "/hisTimetable", method: .get, parameters: parameters, response: TimeTableModel.self) { result in
            switch result {
            case .success(let data):
                self.timeTable = data.hisTimetable
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
