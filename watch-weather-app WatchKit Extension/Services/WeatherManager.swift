//
//  WeatherManager.swift
//  watch-weather-app WatchKit Extension
//
//  Created by Rick Brown on 06/03/2021.
//

import Foundation
import Combine

final class WeatherManager: ObservableObject {
  // create an empty WeatherResponse to publish
  @Published var weatherResponse = WeatherResponse(forecast: [])
  
  func getWeather(for coord: WeatherCoordinates) {
    let url = URL(string: "https://api.lil.software/weather?latitude=\(coord.lat)&longitude=\(coord.lon)")!
    
    NetworkManager<WeatherResponse>().fetch(for: url) { (result) in
      switch result {
      case .success(let weatherResponse):
        self.weatherResponse = weatherResponse
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
    
  }
}
