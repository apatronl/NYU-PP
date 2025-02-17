//
//  ContentView.swift
//  Weather
//
//  Created by Alejandrina Patron on 2/16/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      ScrollView {
        Spacer()
          .frame(height: 30)
        VStack {
          Text("New York")
            .font(.system(size: 32))
            .fontWeight(.semibold)
          Text("32º")
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
        Group {
          VStack(spacing: 20) {
            DailyWeatherRow(
              day: "Now",
              icon: "cloud",
              tempeperature: "32º")
            DailyWeatherRow(
              day: "Mon",
              icon: "cloud",
              tempeperature: "32º")
            DailyWeatherRow(
              day: "Tues",
              icon: "cloud",
              tempeperature: "32º")
            DailyWeatherRow(
              day: "Wed",
              icon: "cloud",
              tempeperature: "32º")
            DailyWeatherRow(
              day: "Thu",
              icon: "cloud",
              tempeperature: "32º")
            DailyWeatherRow(
              day: "Fri",
              icon: "cloud",
              tempeperature: "32º")
            DailyWeatherRow(
              day: "Sat",
              icon: "cloud",
              tempeperature: "32º")
            DailyWeatherRow(
              day: "Sun",
              icon: "cloud",
              tempeperature: "32º")
            
          }
          
        }
        .padding(.all, 8)
        .background(.blue
                    .opacity(0.5))
        .cornerRadius(32)
        .padding(.all, 16)
      }
      .background {
        Image("Weather Background")
      }
    }
  }

struct DailyWeatherRow: View {
  let day: String
  let icon: String
  let tempeperature: String
  
  var body: some View {
    HStack {
      Text(day)
        .frame(width: 60)
      Spacer()
      Image(systemName: icon)
      Spacer()
      Text(tempeperature)
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
