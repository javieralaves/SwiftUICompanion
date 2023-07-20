//
//  DayEntry.swift
//  SwiftUICompanion
//
//  Created by Javier Alaves on 20/7/23.
//

import Foundation

struct DayEntry: Identifiable, Codable {
    var id = UUID()
    let day: Int
    let learning: String
    let feeling: String
}
