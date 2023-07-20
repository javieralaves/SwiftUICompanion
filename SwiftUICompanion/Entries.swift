//
//  Entries.swift
//  SwiftUICompanion
//
//  Created by Javier Alaves on 20/7/23.
//

import Foundation

class Entries: ObservableObject {
    
    @Published var entries = [DayEntry]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(entries) {
                UserDefaults.standard.set(encoded, forKey: "Entries")
            }
        }
    }
    
    init() {
        if let savedEntries = UserDefaults.standard.data(forKey: "Entries") {
            if let decodedEntries = try? JSONDecoder().decode([DayEntry].self, from: savedEntries) {
                entries = decodedEntries
                return
            }
        }
        
        entries = []
    }
    
}
