//
//  ContentView.swift
//  Rock,Papers,Scissors
//
//  Created by Gerardo Leal on 12/05/23.
//

import SwiftUI

struct ButtonView: View {
    var move: String = ""
    
    var body: some View {
        Text("\(move)")
            .font(.system(size: 100))
            .background(
                RoundedRectangle(cornerRadius: 10)
                .fill(Material.ultraThin)
            )
            
    }
}

struct ContentView: View {
    var moves = ["🪨", "📄", "✂️"]
    var beatingMoves = ["📄", "✂️", "🪨"]
    @State private var cpuChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var isGameOver = false
    @State private var round = 1
    @State private var playerMove = ""
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer()
                Text("Score: \(score)")
                    .font(.title)
                Text("Cpu Move:")
                Text(moves[cpuChoice])
                    .font(.system(size: 200))
                if shouldWin {
                    Text("You should win")
                } else {
                    Text("You should lose")
                }
                Spacer()
                
                Text("Your move: ")
                HStack (spacing: 10){
                    ForEach(0..<3) { number in
                        Button{
                            btnTapped(number)
                        } label: {
                            ButtonView(move: beatingMoves[number])
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
                )
                    
                Spacer()
            }
            .navigationTitle("Rock, Paper, Scissors")
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: newRound)
            } message: {
                Text("Your current score is: \(score)")
            }
            .alert("Game Over!", isPresented: $isGameOver) {
                Button("Restart Game", action: restart)
            } message: {
                Text("Your final score is: \(score)")
            }
        }
    }
    
    func btnTapped(_ number: Int){
        if (cpuChoice == number && shouldWin) || (cpuChoice != number && !shouldWin){
            scoreTitle = "You \(beatingMoves[number])ed him!"
            score += 1
        }else if moves[cpuChoice] == beatingMoves[number]{
            scoreTitle = "It's a Tie!"
        } else {
            scoreTitle = "Oh no! he beated you 😢"
        }
        
        round += 1
        if round <= 10 {
            showingScore = true
        } else {
            isGameOver = true
        }
        
    }
    
    func newRound(){
        cpuChoice = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func restart() {
        isGameOver = false
        score = 0
        round = 1
        newRound()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
