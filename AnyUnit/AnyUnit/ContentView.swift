//
//  ContentView.swift
//  AnyUnit
//
//  Created by Amo on 03.04.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Kilometers"
    @State private var selectedCategory = "Length"
    @FocusState private var isInputFocused: Bool
    
    let categories = ["Length", "Temp", "Volume", "Weight"]
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthUnits = ["Meters", "Kilometers", "Miles", "Foots", "Yards"]
    let volumeUnits = ["Milliliters", "Liters", "Cups", "Pints"]
    let weightUnits = ["Grams", "Kilograms", "Ounces", "Pounds"]
    
    var currentUnits: [String] {
        if selectedCategory == "Length" {
            return lengthUnits
        } else if selectedCategory == "Temp" {
            return temperatureUnits
        } else if selectedCategory == "Volume" {
            return volumeUnits
        } else {
            return weightUnits
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Value", value: $inputValue, format: .number)
                    .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("Intput Unit", selection: $inputUnit) {
                        ForEach(currentUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(currentUnits, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("AnyUnit")
            .onChange(of: selectedCategory) {
                inputUnit = currentUnits[0]
                outputUnit = currentUnits[1]
            }
        }
    }
}
    
#Preview {
    ContentView()
}
