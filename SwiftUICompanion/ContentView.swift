//
//  ContentView.swift
//  SwiftUICompanion
//
//  Created by Javier Alaves on 19/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var entries = Entries()
    @State private var showAddEntry = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(entries.entries) { entry in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Day \(String(entry.day))")
                            .font(.headline)
                        Text(entry.learning)
                    }
                }
                .onDelete(perform: removeEntries)
            }
            .navigationTitle("Swift Learnings")
            .toolbar {
                Button {
                    showAddEntry = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddEntry) {
                AddDay(entries: entries)
            }
        }
    }
    
    func removeEntries(at offsets: IndexSet) {
        entries.entries.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
