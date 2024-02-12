//
//  HabitDetailsViewModel.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 12/02/24.
//

import Foundation

@MainActor class HabitDetailsViewModel: ObservableObject {
    @Published var habitsList: HabitsList
    var habit: Habit
    @Published var tempHabit: Habit

    init(habitsList: HabitsList, habit: Habit) {
        self.habitsList = habitsList
        self.habit = habit
        self.tempHabit = habit
    }

    func increaseFrequency() {
        self.tempHabit.increaseFrequency()
    }

    func modifyHabit() {
        if let index = self.habitsList.habits.firstIndex(of: self.habit) {
            self.habitsList.habits[index] = self.tempHabit
        }
    }
}
