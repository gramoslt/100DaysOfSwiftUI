//
//  ContentView.swift
//  UnitConverter
//
//  Created by Gerardo Leal on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnitSelection = ""
    @State private var outputUnitSelection = ""
    @FocusState private var amountIsFocused: Bool
    
    let formatter = MeasurementFormatter()
    
    private let units = ["m", "Km", "feets", "yards", "miles"]
    
    private var measureInCm: Measurement<UnitLength> {
        let measure: Measurement<UnitLength>
        
        switch inputUnitSelection {
        case "m":
            measure = Measurement(value: inputValue, unit: UnitLength.meters)
            return measure.converted(to: UnitLength.centimeters)
        case "Km":
            measure = Measurement(value: inputValue, unit: UnitLength.kilometers)
            return measure.converted(to: UnitLength.centimeters)
        case "feets":
            measure = Measurement(value: inputValue, unit: UnitLength.feet)
            return measure.converted(to: UnitLength.centimeters)
        case "yards":
            measure = Measurement(value: inputValue, unit: UnitLength.yards)
            return measure.converted(to: UnitLength.centimeters)
        case "miles":
            measure = Measurement(value: inputValue, unit: UnitLength.miles)
            return measure.converted(to: UnitLength.centimeters)
        default:
            return Measurement(value: 0, unit: .centimeters)
        }
        
    }
        
    private var result: String {
        
        let res: Measurement<UnitLength>
        
        switch outputUnitSelection {
        case "m":
            res = measureInCm.converted(to: UnitLength.meters)
        case "Km":
            res = measureInCm.converted(to: UnitLength.kilometers)
        case "feets":
            res = measureInCm.converted(to: UnitLength.feet)
        case "yards":
            res = measureInCm.converted(to: UnitLength.yards)
        case "miles":
            res = measureInCm.converted(to: UnitLength.miles)
        default:
            res = Measurement(value: 0, unit: .centimeters)
        }
        
        formatter.unitOptions = .providedUnit
        return formatter.string(from: res)
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Distance", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Unit Measurement:", selection: $inputUnitSelection) {
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                } header: {
                    Text("input the distance convert:")
                }
                
                Section{
                    Text("\(result)")
                    Picker("Unit Measurement:", selection: $outputUnitSelection) {
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Distance converter")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
