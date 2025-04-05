//
//  WeatherViewModel.swift
//  WeatherStarter
//
//  Created by Alejandrina Patron on 4/4/25.
//

import SwiftUI

@Observable
class WeatherViewModel {

  var city = "--"
  var currentTemperature = "--º"
  var dailyWeather: [DailyWeatherViewModel] = []

  private let weatherService: WeatherService
  private let dateFormatter: DateFormatter

  init(weatherService: WeatherService = WeatherbitService()) {
    self.weatherService = weatherService
    self.dateFormatter = DateFormatter()
    self.dateFormatter.dateFormat = "yyyy-MM-dd"
  }

  // TASK: Get city name and current temperature from `currentForecast`
  func fetchWeather() async {
    let currWeatherResult = await weatherService.getCurrentWeather()
    switch currWeatherResult {
    case .success(let currentForecast):
      // TODO: Populate `city` and `currentTemperature`
      print("Add your code here")
    case .failure(let error):
      print(error)
    }

    // TASK: Get each day's forecast from `dailyForecastData`
    let dailyWeatherResult = await weatherService.getDailyForecast()
    switch dailyWeatherResult {
    case .success(let dailyForecastData):
      // TODO: Populate `dailyWeather` list with real data
      print("Add your code here")
    case .failure(let error):
      print(error)
    }
  }
}

struct DailyWeatherViewModel: Identifiable {

  let id = UUID()
  var temp: String
  var day: String
  var icon: String

  init(_ data: DailyForecastData, _ dateFormatter: DateFormatter) {
    self.temp = "\(Int(data.temp))º"

    if let date = dateFormatter.date(from: data.datetime) {
      self.day = date.formatted(Date.FormatStyle().weekday(.abbreviated))
    } else {
      self.day = "--"
    }

    self.icon = Icon.symbolName(data.weather.code)
  }
}
