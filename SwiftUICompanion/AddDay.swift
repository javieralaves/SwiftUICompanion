//
//  AddDay.swift
//  SwiftUICompanion
//
//  Created by Javier Alaves on 19/7/23.
//

import SwiftUI

struct AddDay: View {
    
    @ObservedObject var entries: Entries
    
    @Environment(\.dismiss) var dismiss
    
    @State var day: Int = 1
    @State var learning: String = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                
                // Day
                Picker("Day", selection: $day) {
                    ForEach(1...100, id: \.self) {
                        Text(String($0))
                    }
                }
                .pickerStyle(.navigationLink)
                
                // What you learned
                Section {
                    TextField("What have you learned?", text: $learning, axis: .vertical)
                        .lineLimit(5...10)
                }
                
            }
            .navigationTitle("New learning")
            .toolbar {
                Button("Save") {
                    let entry = DayEntry(day: day, learning: learning)
                    entries.entries.append(entry)
                    dismiss()
                }
            }
        }
    }
}

struct AddDay_Previews: PreviewProvider {
    static var previews: some View {
        AddDay(entries: Entries())
    }
}
