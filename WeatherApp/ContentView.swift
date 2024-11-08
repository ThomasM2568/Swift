//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kyllian Cuevas on 24/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    @EnvironmentObject var forecastsViewModel: ForecastsViewModel
    
    var body: some View {
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [isNight ? Color.black : Color.blue,Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Montbéliard, FR")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                    Button {
                        forecastsViewModel.reloadTemperature()
                    }label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .font(.title)
                            .foregroundStyle(.white)
                    }
                }
                Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text(isNight ? "10°C" : "22°C")
                    .font(.system(size: 50, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(28)
                
                HStack(spacing:20) {
                    WeatherDayView(dayOfWeek: forecastsViewModel.getDayString(for: 0), imageName: "cloud.sun.fill", temperature: forecastsViewModel.getTemp(for: 0))
                    WeatherDayView(dayOfWeek: forecastsViewModel.getDayString(for: 1), imageName: "sun.max.fill", temperature: forecastsViewModel.getTemp(for: 1))
                    WeatherDayView(dayOfWeek: forecastsViewModel.getDayString(for: 2), imageName: "wind.snow", temperature: forecastsViewModel.getTemp(for: 2))
                    WeatherDayView(dayOfWeek: forecastsViewModel.getDayString(for: 3), imageName: "snow", temperature: forecastsViewModel.getTemp(for: 3))
                    WeatherDayView(dayOfWeek: forecastsViewModel.getDayString(for: 4), imageName: "cloud.rain.fill", temperature: forecastsViewModel.getTemp(for: 4))
                }
                
                Spacer()
                
                Button {
                    print("Button tapped")
                    isNight.toggle()
                }label:{
                    Text("Change Day Time")
                        .frame(width: 200, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
    
    
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .foregroundStyle(.white)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ForecastsViewModel())
    }
}
