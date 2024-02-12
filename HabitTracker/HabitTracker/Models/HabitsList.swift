//
//  HabitsList.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import Foundation

struct Habit: Identifiable, Hashable, Codable, Equatable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var frequency: Int
}

extension Habit {
    static let mockHabit = Habit(name: "Exercise", description: "go to the gym", frequency: 1)

    mutating func increaseFrequency() {
        self.frequency += 1
    }
}

class HabitsList: ObservableObject, Hashable {
    var habits: [Habit]

    init(habits: [Habit] = [Habit]()) {
        self.habits = habits
    }

    static func == (lhs: HabitsList, rhs: HabitsList) -> Bool {
        lhs.habits == rhs.habits
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(habits)
    }
}
