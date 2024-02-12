//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import SwiftUI

struct HabitDetailsView: View {
    @StateObject var viewModel: HabitDetailsViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text(viewModel.habit.name)
            Text(viewModel.habit.description)
            Text("Frequency: \(viewModel.tempHabit.frequency)")

            Button {
                viewModel.increaseFrequency()
            } label: {
                Image(systemName: "plus")
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .destructive) {
                        print("Cancelled")
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.red)
                    }
                }

                ToolbarItem(placement: .primaryAction) {
                    Button {
                        print("Saved")
                        viewModel.modifyHabit()
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }

    }
}

#Preview {
    HabitDetailsView(viewModel: HabitDetailsViewModel(habitsList: HabitsList(), habit: Habit.mockHabit))
}
