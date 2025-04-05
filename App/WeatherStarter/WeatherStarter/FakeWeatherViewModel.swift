//
//  FakeWeatherViewModel.swift
//  WeatherStarter
//
//  Created by Alejandrina Patron on 4/4/25.
//

class FakeWeatherViewModel: WeatherViewModel {
  init () {
    super.init(weatherService: NoopWeatherService())
    self.city = "Los Angeles"
    self.currentTemperature = "19º"
    self.dailyWeather = [
      .init(day: "Fri", temp: "21º"),
      .init(day: "Sat", temp: "26º"),
      .init(day: "Sun", temp: "27º"),
      .init(day: "Mon", temp: "26º"),
      .init(day: "Tue", temp: "25º"),
      .init(day: "Wed", temp: "27º"),
      .init(day: "Thu", temp: "28º"),
      .init(day: "Fri", temp: "27º"),
    ]
  }

  override func fetchWeather() async {
    // Intentionally empty
  }
}

// MARK: -

extension DailyWeatherViewModel {

  fileprivate init(day: String, temp: String, icon: String = "sun.max") {
    self.day = day
    self.temp = temp
    self.icon = icon
  }
}

// MARK: -

extension WeatherViewModel {

  static var fake: WeatherViewModel {
    FakeWeatherViewModel()
  }
}

// MARK: - NoopWeatherService

class NoopWeatherService: WeatherService {

  func getCurrentWeather() async -> Result<CurrentForecast, any Error> {
    return .success(CurrentForecast(data: []))
  }

  func getDailyForecast() async -> Result<DailyForecast, any Error> {
    return .success(DailyForecast(data: []))
  }
}
