//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by devxcode on 24/09/2024.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ForecastsViewModel())
        }
    }
}
