//
//  SkoolIconography.swift
//  Skool
//
//  Created by dgsw30 on 11/22/24.
//

import Foundation
import SwiftUI

enum SkoolIconography: String {
    case TimeTable = "TimeTable"
    case Seat = "Seat"
    case meal = "Meal"
    case menu = "Menu"
    case seatTable = "SeatTable"
    case mealNotFound = "NotFound"
    case timeTableNotFound = "NotFound1"
    case setting = "Setting"
    case headset = "Headset"
    case schoolhat = "SchoolHat"
    case key = "Key"
    
    //MARK: click
    case clickTimeTable = "ClickTime"
    case clickSeat = "ClickSeat"
    case clickMeal = "ClickMeal"
    case clickSetting = "ClickSetting"
}

extension Image {
    init(icon: SkoolIconography) {
        self = Image(icon.rawValue)
    }
}
