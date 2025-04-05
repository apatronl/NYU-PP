//
//  Forecast.swift
//  WeatherStarter
//
//  Created by Alejandrina Patron on 4/4/25.
//

import Foundation

struct CurrentForecast: Decodable {
  let data: [CurrentForecastData]
}

struct CurrentForecastData: Decodable {
  let city_name: String
  let temp: Double
}

struct DailyForecast: Decodable {
  let data: [DailyForecastData]
}

struct DailyForecastData: Decodable {
  let temp: Double
  let datetime: String
  let weather: WeatherData
}

struct WeatherData: Decodable {
  let code: Int
}
