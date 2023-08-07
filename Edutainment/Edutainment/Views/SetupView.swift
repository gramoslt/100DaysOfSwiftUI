//
//  SetupView.swift
//  Edutainment
//
//  Created by Gerardo Leal on 23/06/23.
//

import SwiftUI

struct SetupView: View {
    
    @State var levelSelected: Int = 1
    @State var questionsToAnswer: Int = 5
    @StateObject var game = GameViewModel()
    @State var isGamePlaying = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo
                    .ignoresSafeArea()
                
                VStack{
                    GameTitle()
                    
                    Divider()
                        .padding()
                    
                    LevelPicker(levelSelected: $levelSelected)
                    
                    QuestionsToAnswerPicker(questionsToAnswer: $questionsToAnswer)
                    
                    StartButton(levelSelected: $levelSelected, questionsToAnswer: $questionsToAnswer, isGamePlaying: $isGamePlaying,game: game)
                        .shadow(radius: 8, x:5, y:5)
                        .fullScreenCover(isPresented: $isGamePlaying) {
                            GameView(game: game)
                        }
                    
                    Spacer()
                }
            }
            
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                }
            }
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}

struct StartButton: View {
    @Binding var levelSelected: Int
    @Binding var questionsToAnswer: Int
    @Binding var isGamePlaying: Bool
    @ObservedObject var game: GameViewModel
    
    var body: some View {
        Button {
            // Start Game
            isGamePlaying.toggle()
            game.newGame(levelSelected: levelSelected, totalRounds: questionsToAnswer)
            
            
        } label: {
            Text("Start")
                .font(.title)
                .fontDesign(.rounded)
                .frame(width: 180, height: 90)
                .background(.white)
                .foregroundColor(.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 9))
        }
    }
}

struct GameTitle: View {
    var body: some View {
        Text("Times Tables")
            .font(.largeTitle)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .fontDesign(.rounded)
    }
}
