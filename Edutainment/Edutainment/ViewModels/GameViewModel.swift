//
//  GameViewModel.swift
//  Edutainment
//
//  Created by Gerardo Leal on 23/06/23.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var game = Game()
    
    func nextRound() {
        game.currentRound += 1
        // check answer
        
    }
    
    func newGame(levelSelected: Int, totalRounds: Int) {
        
        game.levelSelected = levelSelected
        game.totalRounds = totalRounds
        
        // Reset game values
        game.currentRound = 0
        game.score = 0
        
        var questionTemp: Question
        
        // Generate questions array
        for _ in 1...game.totalRounds {
            questionTemp = Question(x: game.levelSelected, y: Int.random(in: 2..<13))
            questionTemp.generateOptions()
            game.questions.append(questionTemp)
        }
        
    }
    
    func checkAnswer(userAnswer: Int, question: Question) {
        if userAnswer == question.answer {
            game.score += 1
        }
    }
    
    static var mock: GameViewModel {
        let mock = GameViewModel()
        var question = Question.mock
        question.generateOptions()
        mock.game.questions = [question]
        return mock
    }
}
