//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Alejandrina Patron on 2/17/25.
//

import SwiftUI

@Observable
class WeatherViewModel {

  var city = "--"
  var currentTemperature = "--º"
  var dailyWeather: [DailyWeatherViewModel] = []

  private let weatherService: WeatherService
  private let dateFormatter: DateFormatter

  init(weatherService: WeatherService = WeatherService()) {
    self.weatherService = weatherService
    self.dateFormatter = DateFormatter()
    self.dateFormatter.dateFormat = "yyyy-MM-dd"
  }

  func fetchWeather() async {
    let result = await weatherService.getCurrentWeather()
    switch result {
    case .success(let currentForecast):
      self.city = currentForecast.data.first!.city_name
      self.currentTemperature = "\(Int(currentForecast.data.first!.temp))º"
    case .failure(let error):
      print(error)
    }

    let dailyResult = await weatherService.getDailyForecast()
    switch dailyResult {
    case .success(let dailyForecastData):
      self.dailyWeather = dailyForecastData.data.map { .init($0, dateFormatter) }
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

    // TODO: Move this parsing elsewhere
    if let date = dateFormatter.date(from: data.datetime) {
      self.day = date.formatted(Date.FormatStyle().weekday(.abbreviated))
    } else {
      self.day = "--"
    }

    self.icon = Icon.symbolName(data.weather.code)
  }
}
