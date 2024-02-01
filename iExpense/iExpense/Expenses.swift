//
//  Expenses.swift
//  iExpense
//
//  Created by Gerardo Leal on 04/07/23.
//

import Foundation

class Expenses: ObservableObject, Hashable {
    static func == (lhs: Expenses, rhs: Expenses) -> Bool {
        lhs.items == rhs.items
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(items)
    }

    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "items")
            }
        }
    }
    
    var businessExpenses: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    var personalExpenses: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}
