//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gerardo Leal on 05/05/23.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View{
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"] .shuffled()
    @State private var correctanswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var isGameOver = false
    @State private var round = 1
    @State private var degrees = [0.0,0.0,0.0]
    @State private var opacities = [1.0,1.0,1.0]
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.3), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .modifier(Title())
                
                VStack (spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctanswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                            withAnimation {
                                degrees[number] += 180
                            }
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .rotation3DEffect(.degrees(degrees[number]), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(score)")
        }
        .alert("Game Over!", isPresented: $isGameOver) {
            Button("Restart Game", action: restart)
        } message: {
            Text("Your final score is: \(score)")
        }
    }
    
     func flagTapped(_ number: Int){
        if number == correctanswer{
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong!, that's \(countries[number])'s flag"
        }
        
        round += 1
         if round <= 8{
             showingScore = true
         } else {
             isGameOver = true
         }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctanswer = Int.random(in: 0...2)
    }
    
    func restart(){
        score = 0
        isGameOver = false
        round = 1
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
