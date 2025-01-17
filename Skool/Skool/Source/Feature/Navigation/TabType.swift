import Foundation

enum TabType: CaseIterable {
    case timeTable
    case seat
    case meal
    case setting
    
    var image: String {
        switch self {
        case .meal:
            "Meal"
        case .timeTable:
            "TimeTable"
        case .seat:
            "Seat"
        case .setting:
            "Setting"
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
        case .setting:
            "ClickSetting"
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
        case .setting:
            "설정"
        }
    }
}
