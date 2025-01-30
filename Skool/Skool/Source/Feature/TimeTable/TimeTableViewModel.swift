//
//  TimeTableViewModel.swift
//  Skool
//
//  Created by dgsw30 on 1/1/25.
//

import Foundation

class TimeTableViewModel: ObservableObject {
    @Published var timeTable: [TimeTableEntry] = []
    @Published var grade = ""
    @Published var classNum = ""
    
    init() {
        self.timeTable = []
    }
    
    
    func fetchTimeTable(date: String) {
        let parameters: [String: String] = [
            "KEY": "8ceb4ff12ab34574bb2d9bcb5bf23758",
            "Type": "json",
            "ATPT_OFCDC_SC_CODE": "D10",
            "SD_SCHUL_CODE": "7240454",
            "ALL_TI_YMD": date,
            "GRADE": grade,
            "CLASS_NM": classNum
        ]
        SkoolNetworkRunner.shared.TimeTableRequest(url: "/hisTimetable", method: .get, parameters: parameters, response: TimeTableModel.self) { result in
            switch result {
            case .success(let data):
                self.timeTable = data.hisTimetable.compactMap { $0.row }.flatMap { $0 }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
