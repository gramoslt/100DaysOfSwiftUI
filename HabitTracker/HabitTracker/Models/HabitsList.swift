//
//  HabitsList.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import Foundation

struct Habit: Identifiable {
    let id: UUID = UUID()
    var name: String
    var frequency: Int
}

@Observable
class HabitsList {
    var habits: [Habit]

    init(habits: [Habit]) {
        self.habits = habits
    }
}
