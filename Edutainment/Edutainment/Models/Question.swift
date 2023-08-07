//
//  Question.swift
//  Edutainment
//
//  Created by Gerardo Leal on 23/06/23.
//

import Foundation

struct Question {
    var x: Int
    var y: Int
    var text: String {
        "\(x) x \(y)"
    }
    var answer: Int {
        x * y
    }
    
    var answers: [Int] = []
    
    mutating func generateOptions(){
        var randomNumber: Int
        self.answers.append(self.answer)
        
        // no repeating numbers
        for _ in 1...3{
            randomNumber = x * Int.random(in: 1...12)
            
            while self.answers.contains(randomNumber){
                randomNumber = x * Int.random(in: 1...12)
            }
            
            self.answers.append(randomNumber)
        }
        
        self.answers.shuffle()
        
    }
    
    static let mock = Question(x: 2, y: 2)
}
