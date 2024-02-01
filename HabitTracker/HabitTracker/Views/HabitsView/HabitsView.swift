//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import SwiftUI

struct HabitsView: View {
    @StateObject var habitsViewModel: HabitsViewModel = HabitsViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(habitsViewModel.habitsList.habits) { habit in
                    VStack {
                        Text("\(habit.name) - \(habit.frequency)")
                    }
                }
            }
            .sheet(isPresented: $habitsViewModel.isShowingSheet) {
                AddHabitView()
            }
            .navigationTitle("Habits Tracker")
            .toolbar {
                ToolbarItem {
                    Button {
                        habitsViewModel.isShowingSheet = true
                    } label: {
                        Label("Add", systemImage: "plus.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    HabitsView()
}
