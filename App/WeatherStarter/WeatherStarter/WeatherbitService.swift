//
//  WeatherbitService.swift
//  WeatherStarter
//
//  Created by Alejandrina Patron on 4/4/25.
//

import Foundation

// Task: Add your API key
class WeatherbitService: WeatherService {
  
  // Get your API key at https://www.weatherbit.io/
  // Default temperature unit is Celsius, but can be changed to Farenheit by adding `units=I` to the url

  // TODO: Add your API key here
  private let apiKey = "YOUR_API_KEY"

  private let baseURL = "https://api.weatherbit.io/v2.0/"
  private let nyc = (lat: 40.71, lon: -74)
  private let decoder = JSONDecoder()

  func getCurrentWeather() async -> Result<CurrentForecast, Error> {
    let url = "\(baseURL)current?lat=\(nyc.lat)&lon=\(nyc.lon)&key=\(apiKey)"
    do {
      let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
      let forecast = try decoder.decode(CurrentForecast.self, from: data)
      return .success(forecast)
    } catch {
      return .failure(error)
    }
  }

  func getDailyForecast() async -> Result<DailyForecast, Error> {
    let url = "\(baseURL)forecast/daily?lat=\(nyc.lat)&lon=\(nyc.lon)&key=\(apiKey)"
    do {
      let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
      let forecast = try decoder.decode(DailyForecast.self, from: data)
      return .success(forecast)
    } catch {
      return .failure(error)
    }
  }
}
