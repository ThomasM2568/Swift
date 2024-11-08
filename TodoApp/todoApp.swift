//
//  todoApp.swift
//  todo
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

@main
struct todoApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(TodoViewModel())
        }
    }
}
