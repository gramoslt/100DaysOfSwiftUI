//
//  AddHabitViewModel.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import Foundation

@MainActor class AddHabitViewModel: ObservableObject {
    @Published var activity = ""
    @Published var description = ""
    var habitsList: HabitsList

    init(activity: String = "", description: String = "", habitsList: HabitsList) {
        self.activity = activity
        self.description = description
        self.habitsList = habitsList
    }

    func saveHabit() {
        let newHabit = Habit(name: self.activity, description: self.description, frequency: 0)
        habitsList.habits.append(newHabit)
    }
}
