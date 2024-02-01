//
//  ContentView.swift
//  iExpense
//
//  Created by Gerardo Leal on 03/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Personal Expenses", expenses: expenses.personalExpenses, deleteItems: removePersonalItems)
                ExpenseSection(title: "Business Expenses", expenses: expenses.businessExpenses, deleteItems: removeBusinessItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink(value: expenses) {
                    Image(systemName: "plus")
                }
            }
            .navigationDestination(for: Expenses.self) { expenses in
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) { // function used to delete items in our list
            var objectsToDelete = IndexSet()
            
            for offset in offsets {
                let item = inputArray[offset]
                
                if let index = expenses.items.firstIndex(of: item) {
                    objectsToDelete.insert(index)
                }
            }
            
            expenses.items.remove(atOffsets: objectsToDelete)
        }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalExpenses)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessExpenses)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section {
            ForEach(expenses) { item in
                HStack {
                    VStack (alignment: .leading){
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(item.amount <= 10 ? .green : item.amount <= 100 ? .blue : .red)
                }
            }
            .onDelete(perform: deleteItems)
        } header: {
            Text(title)
        }
    }
}
