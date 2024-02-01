//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import SwiftUI

struct AddHabitView: View {
    @StateObject var viewModel: AddHabitViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Activity", text: $viewModel.activity)
                        .textFieldStyle(.roundedBorder)
                    TextField("Description", text: $viewModel.description)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()

                Spacer()
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
                                viewModel.saveHabit()
                                dismiss()
                            } label: {
                                Text("Save")
                            }
                        }
                    }
            }
        }

    }
}

#Preview {
    AddHabitView(viewModel: AddHabitViewModel(habitsList: HabitsList()))
}
