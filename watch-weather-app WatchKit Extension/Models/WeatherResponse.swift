//
//  Weather.swift
//  watch-weather-app WatchKit Extension
//
//  Created by Rick Brown on 06/03/2021.
//

import Foundation

struct WeatherResponse: Codable {
  let forecast: [WeatherModel]
}
