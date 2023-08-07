//
//  ContentView.swift
//  Edutainment
//
//  Created by Gerardo Leal on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            SetupView()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct QuestionsToAnswerPicker: View {
    
    @Binding var questionsToAnswer: Int
    var questionsQuantities = [5, 10, 15, 20]
    
    var body: some View {
        VStack (alignment:.leading){
            SectionHeader(text: "Questions to answer")
            Picker("Questions to answer", selection: $questionsToAnswer) {
                ForEach(questionsQuantities, id: \.self) { n in
                    Text("\(n)")
                        
                }
            }
            .pickerStyle(.segmented)
            
        }
        .padding()
    }
}

struct LevelPicker: View {
    @Binding var levelSelected: Int
    
    var body: some View {
        VStack (alignment: .leading){
            SectionHeader(text:"Select Times Table")
                
            
            LevelPickerRow(rangeStart: 1, rangeEnd: 7, levelSelected: $levelSelected)
            LevelPickerRow(rangeStart: 7, rangeEnd: 13, levelSelected: $levelSelected)
            
        }
    }
}

struct LevelPickerRow: View {
    let rangeStart: Int
    let rangeEnd: Int
    @Binding var levelSelected: Int
    
    var body: some View {
        HStack {
            ForEach(rangeStart..<rangeEnd, id: \.self){ n in
                Text("\(n)")
                    .frame(width: 50, height: 50)
                    .onTapGesture {
                        withAnimation {
                            levelSelected = n
                        }
                    }
                    .background(levelSelected == n ? .mint : .white)
                    .opacity(levelSelected == n ? 1 : 0.85)
                    .clipShape(RoundedRectangle(cornerRadius: 9))
                
            }
        }
    }
}

struct SectionHeader: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.title2)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
    }
}
