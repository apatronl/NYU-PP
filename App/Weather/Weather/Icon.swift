//
//  Icon.swift
//  Weather
//
//  Created by Alejandrina Patron on 2/18/25.
//

enum Icon {

  static func symbolName(_ code: Int) -> String {
    guard let symbol = Icon.codeToSymbol[code] else {
      fatalError("Could not find icon for code \(code)")
    }
    return symbol
  }

  private static let codeToSymbol: [Int: String] = [
    200: "cloud.bolt.rain",
    201: "cloud.bolt.rain",
    202: "cloud.bolt.rain",
    230: "cloud.bolt",
    231: "cloud.bolt",
    232: "cloud.bolt",
    233: "cloud.bolt",
    300: "cloud.drizzle",
    301: "cloud.drizzle",
    302: "cloud.drizzle",
    500: "cloud.rain",
    501: "cloud.rain",
    502: "cloud.rain",
    511: "cloud.rain",
    520: "cloud.rain",
    521: "cloud.rain",
    522: "cloud.rain",
    600: "cloud.snow",
    601: "cloud.snow",
    602: "cloud.snow",
    610: "cloud.snow",
    611: "cloud.sleet",
    612: "cloud.sleet",
    621: "cloud.snow",
    622: "cloud.snow",
    623: "cloud.snow",
    700: "cloud.fog",
    711: "cloud.fog",
    721: "cloud.fog",
    731: "cloud.fog",
    741: "cloud.fog",
    751: "cloud.fog",
    800: "sun.max",
    801: "cloud.sun",
    802: "cloud.sun",
    803: "cloud.sun",
    804: "smoke",
    900: "cloud.rain",
  ]
}
