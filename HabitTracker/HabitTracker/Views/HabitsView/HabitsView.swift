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
                    NavigationLink(value: habit) {
                        HStack {
                            Text("\(habit.name)")
                            Spacer()
                            Text("\(habit.frequency)")
                        }
                    }
                }
            }
            .sheet(isPresented: $habitsViewModel.isShowingSheet) {
                AddHabitView(viewModel: AddHabitViewModel(habitsList: habitsViewModel.habitsList))
            }
            .navigationTitle("Habits Tracker")
            .navigationDestination(for: Habit.self) { habit in
                HabitDetailsView(
                    viewModel: HabitDetailsViewModel(
                        habitsList: habitsViewModel.habitsList,
                        habit: habit)
                )
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        habitsViewModel.showSheet()
                    } label: {
                        Label("Add", systemImage: "plus.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    HabitsView(habitsViewModel: HabitsViewModel(habitsList: HabitsList(habits: [Habit.mockHabit])))
}
