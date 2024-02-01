//
//  ExpenseFile.swift
//  iExpense
//
//  Created by Gerardo Leal on 04/07/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

