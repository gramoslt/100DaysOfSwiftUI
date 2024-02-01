//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import Foundation

@MainActor class HabitsViewModel: ObservableObject {
    @Published var habitsList: HabitsList
    @Published var isShowingSheet: Bool

    init(habitsList: HabitsList = HabitsList(), isShowingSheet: Bool = false) {
        self.habitsList = habitsList
        self.isShowingSheet = isShowingSheet
    }

    func showSheet() {
        self.isShowingSheet = true
    }
}
