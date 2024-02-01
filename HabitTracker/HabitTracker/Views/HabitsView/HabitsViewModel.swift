//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import Foundation

@MainActor class HabitsViewModel: ObservableObject {
    @Published var habitsList: HabitsList = HabitsList()
    @Published var isShowingSheet: Bool = false

    func showSheet() {
        self.isShowingSheet = true
    }
}
