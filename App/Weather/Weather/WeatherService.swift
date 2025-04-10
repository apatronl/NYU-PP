//
//  WeatherService.swift
//  Weather
//
//  Created by Alejandrina Patron on 2/16/25.
//

import Foundation

protocol WeatherService {

  func getCurrentWeather() async -> Result<CurrentForecast, Error>
  func getDailyForecast() async -> Result<DailyForecast, Error>
}
