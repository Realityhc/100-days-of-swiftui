//
//  ContentView.swift
//  WeSplit
//
//  Created by Amo on 23.03.2026.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your Student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
            }
        }
    }

            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    ContentView()
}

