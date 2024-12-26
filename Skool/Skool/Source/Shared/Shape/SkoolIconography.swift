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
}

extension Image {
    init(icon: SkoolIconography) {
        self = Image(icon.rawValue)
    }
}

struct SkoolTests {
    var body: some View {
        Image(icon: .Seat)
    }
}
