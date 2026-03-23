//
//  ContentView.swift
//  WeSplit
//
//  Created by Amo on 23.03.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Привіт, Рена ^^")
            Text("це мій перший додаток!")
            
            Form {
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                    Text("Hello, world!")
                    Text("Hello, world!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

