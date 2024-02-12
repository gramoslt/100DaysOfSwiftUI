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
    @Published var habits = [Habit]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(habits){
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "habits"){
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems){
                habits = decodedItems
                return
            }
        }
        habits = []
    }

    static func == (lhs: HabitsList, rhs: HabitsList) -> Bool {
        lhs.habits == rhs.habits
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(habits)
    }
}
