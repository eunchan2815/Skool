import Foundation

enum TabType: CaseIterable {
    case timeTable
    case seat
    case meal
    
    var image: String {
        switch self {
        case .meal:
            "Meal"
        case .timeTable:
            "TimeTable"
        case .seat:
            "Seat"
        }
    }
    
    var click: String {
        switch self {
        case .meal:
            "ClickMeal"
        case .timeTable:
            "ClickTime"
        case .seat:
            "ClickSeat"
        }
    }
    
    var text: String {
        switch self {
        case .meal:
            "급식"
        case .timeTable:
            "시간표"
        case .seat:
            "자리뽑기"
        }
    }
}
