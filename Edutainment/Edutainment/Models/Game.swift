//
//  Game.swift
//  Edutainment
//
//  Created by Gerardo Leal on 23/06/23.
//

import Foundation

struct Game{
    var levelSelected: Int = 1
    var totalRounds: Int = 5
    var currentRound: Int = 0
    var questions: [Question] = []
    var score: Int = 0
    
}
