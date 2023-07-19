//
//  AddDay.swift
//  SwiftUICompanion
//
//  Created by Javier Alaves on 19/7/23.
//

import SwiftUI

struct AddDay: View {
    var body: some View {
        
        @State var day: Int = 1
        @State var learning: String = ""
        @State var shipped: Bool = false
        
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
                
                // Shipped to Github?
                Toggle("Pushed to GitHub", isOn: $shipped)
                
            }
            .navigationTitle("New date")
        }
    }
}

struct AddDay_Previews: PreviewProvider {
    static var previews: some View {
        AddDay()
    }
}
