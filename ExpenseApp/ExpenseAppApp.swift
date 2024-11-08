//
//  ExpenseAppApp.swift
//  ExpenseApp
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

@main
struct ExpenseAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(data: Expenses.testData)
        }
    }
}
