//
//  HabitsList.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import Foundation

struct Habit: Identifiable, Hashable {
    let id: UUID = UUID()
    var name: String
    var description: String
    var frequency: Int
}

class HabitsList: ObservableObject, Hashable {
    static func == (lhs: HabitsList, rhs: HabitsList) -> Bool {
        lhs.habits == rhs.habits
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(habits)
    }

    var habits: [Habit]

    init(habits: [Habit] = [Habit]()) {
        self.habits = habits
    }
}
