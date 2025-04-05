//
//  WeatherService.swift
//  WeatherStarter
//
//  Created by Alejandrina Patron on 4/3/25.
//

import Foundation

protocol WeatherService {

  func getCurrentWeather() async -> Result<CurrentForecast, Error>
  func getDailyForecast() async -> Result<DailyForecast, Error>
}
