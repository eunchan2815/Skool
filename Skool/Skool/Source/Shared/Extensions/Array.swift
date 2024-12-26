//
//  Array.swift
//  Skool
//
//  Created by dgsw30 on 12/26/24.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
