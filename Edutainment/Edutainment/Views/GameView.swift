//
//  GameView.swift
//  Edutainment
//
//  Created by Gerardo Leal on 23/06/23.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var game: GameViewModel
    @State var gameEnded = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.indigo
                    .ignoresSafeArea()
                
                VStack {
                    GameTitle()
                    Divider()
                        .padding()
                    
                    QuestionContainer(game: game)
                    Text("Score: \(game.game.score)")
                        .foregroundColor(.white)
                    
                    Spacer()
                    SectionHeader(text: "Answer ")
                    ForEach(game.game.questions[game.game.currentRound].answers, id: \.self) {option in
                        Button {
                            game.checkAnswer(userAnswer: option, question: game.game.questions[game.game.currentRound])
                            
                            if game.game.currentRound < game.game.totalRounds - 1 {
                                game.nextRound()
                            } else {
                                gameEnded.toggle()
                            }
                        } label: {
                            Text("\(option)")
                                .frame(width: 300, height: 50)
                                .background()
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                        }

                    }
                    .alert("Game Over!", isPresented: $gameEnded) {
                        Button("Restart Game") {
                            dismiss()
                        }
                        Button("Exit", role: .cancel) {
                            
                        }
                        
                    } message: {
                        Text("Your Final Score is: \(game.game.score)")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameView(game: GameViewModel.mock)
    }
}

struct QuestionContainer: View {
    @ObservedObject var game: GameViewModel
    
    var body: some View {
        Text("\(game.game.questions[game.game.currentRound].text)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .frame(width: 300, height: 200)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 9))
    }
}
