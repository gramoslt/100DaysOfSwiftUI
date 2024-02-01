//
//  AddView.swift
//  iExpense
//
//  Created by Gerardo Leal on 04/07/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses: Expenses
    @State private var name = "name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Business", "Personal"]

    var body: some View {
        Form {

            Picker("Type", selection: $type) {
                ForEach(types, id: \.self){
                    Text($0)
                }
            }

            TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
        }
        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
                .foregroundStyle(.red)
            }

            ToolbarItem {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
