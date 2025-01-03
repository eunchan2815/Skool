//
//  WeekDays.swift
//  Skool
//
//  Created by dgsw30 on 1/3/25.
//

import Foundation

class DateViewModel: ObservableObject {
    @Published var currentWeek: [Date] = []
    @Published var currentDate = Date()
    
    init() {
        fetchCurrentWeek()
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekdayOrdinal, for: today)
        
        guard let firstWeekday = week?.start else { return }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(bySetting: .day, value: day, of: firstWeekday) {
                currentWeek.append(weekday)
            }
        }
    }
    
    
    //MARK: 날짜 변환
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
    
    func cleanDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: currentDate)
    }
}
