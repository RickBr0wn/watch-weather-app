//
//  WeatherModel.swift
//  watch-weather-app WatchKit Extension
//
//  Created by Rick Brown on 06/03/2021.
//

import Foundation

struct WeatherModel: Codable {
  let name: String
  let temperature: Int
  let unit: String
  let description: String
  var conditions: String {
    switch description {
    case let str where str.lowercased().contains("clear"):
      return "sun.min"
    case let str where str.lowercased().contains("rain"):
      return "cloud.rain"
    case let str where str.lowercased().contains("sunny"):
      return "sun.max"
    case let str where str.lowercased().contains("clouds"):
      return "cloud"
    case let str where str.lowercased().contains("snow"):
      return "cloud.snow"
    case let str where str.lowercased().contains("storm"):
      return "tropicalstorm"
    default:
      return "sun.min"
    }
  }
}
