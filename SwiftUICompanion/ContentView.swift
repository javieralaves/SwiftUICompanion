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
                    VStack(alignment: .leading) {
                        Text(String(entry.day))
                        Text(entry.learning)
                    }
                }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
