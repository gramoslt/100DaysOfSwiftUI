//
//  HabitDetailsView.swift
//  HabitTracker
//
//  Created by Gerardo Ramos on 01/02/24.
//

import SwiftUI

struct HabitDetailsView: View {
    let habit: Habit

    var body: some View {
        VStack {
            Text(habit.name)
            Text(habit.description)
            Text("Frequency: \(habit.frequency)")

        }
    }
}

#Preview {
    HabitDetailsView(habit: Habit.mockHabit)
}
