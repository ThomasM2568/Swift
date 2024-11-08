//
//  ForecastsViewModel.swift
//  WeatherApp
//
//  Created by devxcode on 24/09/2024.
//

import Foundation


class ForecastsViewModel: ObservableObject {
    
    @Published var forecasts: [Temperature] = []
    
    init() {
        getForecasts()
    }
    
    func getForecasts() {
        
        let newForecasts = [
            Temperature(dayOfWeek: "MON", temp: 20),
            Temperature(dayOfWeek: "TUE", temp: 30),
            Temperature(dayOfWeek: "WED", temp: 0),
            Temperature(dayOfWeek: "THU", temp: -10),
            Temperature(dayOfWeek: "FRI", temp: 15),
        ]
        
        self.forecasts += newForecasts
    }
    
    //getDayString(for: 0)
    func getDayString(for index: Int) -> String {
        return forecasts[index].dayOfWeek
    }
    
    func getTemp(for index: Int) -> Int {
        return forecasts[index].temp
    }
    
    func reloadTemperature() {
        for i in 0..<forecasts.count {
            forecasts[i].temp += 1
        }
    }
}
