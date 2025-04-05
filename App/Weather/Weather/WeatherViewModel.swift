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

  init(weatherService: WeatherService = WeatherbitService()) {
    self.weatherService = weatherService
    self.dateFormatter = DateFormatter()
    self.dateFormatter.dateFormat = "yyyy-MM-dd"
  }

  func fetchWeather() async {
    let currWeatherResult = await weatherService.getCurrentWeather()
    switch currWeatherResult {
    case .success(let currentForecast):
      self.city = currentForecast.data.first!.city_name
      self.currentTemperature = "\(Int(currentForecast.data.first!.temp))º"
    case .failure(let error):
      print(error)
    }

    let dailyWeatherResult = await weatherService.getDailyForecast()
    switch dailyWeatherResult {
    case .success(let dailyForecast):
      self.dailyWeather = dailyForecast.data.map { .init($0, dateFormatter) }
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
