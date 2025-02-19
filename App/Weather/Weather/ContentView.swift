//
//  ContentView.swift
//  Weather
//
//  Created by Alejandrina Patron on 2/16/25.
//

import SwiftUI

struct ContentView: View {
  
  @State private var viewModel = WeatherViewModel()

  var body: some View {
    ScrollView {
      Spacer()
        .frame(height: 30)
      VStack {
        Text(viewModel.city)
          .font(.system(size: 32))
          .fontWeight(.semibold)
        Text(viewModel.currentTemperature)
          .font(.system(size: 120))
          .fontWeight(.thin)
      }
      .foregroundColor(.white)
      .shadow(
        color: .black.opacity(0.25),
        radius: 3,
        x: 0,
        y: 3)
      .padding()

      if !viewModel.dailyWeather.isEmpty {
        VStack(spacing: 20) {
          ForEach(viewModel.dailyWeather) { weather in
            DailyWeatherRow(weather: weather)
          }
        }
        .padding(.all, 8)
        .background(.blue.opacity(0.5))
        .cornerRadius(32)
        .padding(.all, 16)
      }
    }
    .background {
      Image("Weather Background")
    }.task {
      await viewModel.fetchWeather()
    }
  }

  struct DailyWeatherRow: View {
    let weather: DailyWeatherViewModel
    
    var body: some View {
      HStack {
        Text(weather.day)
          .frame(width: 60)
        Spacer()
        Image(systemName: weather.icon)
        Spacer()
        Text(weather.temp)
          .frame(width: 60)
      }
      .font(.system(size: 24)).fontWeight(.medium)
      .foregroundColor(.white)
      .padding(.all, 16)
      
    }
  }
}

#Preview {
  ContentView()
}
