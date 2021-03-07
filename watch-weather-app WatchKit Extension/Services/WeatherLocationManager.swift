//
//  LocationManager.swift
//  watch-weather-app WatchKit Extension
//
//  Created by Rick Brown on 06/03/2021.
//
import Foundation
import CoreLocation

final class WeatherLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  // prepare variables for publishing
  @Published var cityName = "San Francisco"
  @Published var coordinate = CLLocationCoordinate2D(latitude: 37.231, longitude: -122.2322)
  // define a locationManage of type CLLocationManager
  private var locationManager: CLLocationManager
  // overide the init() function to set the locationManger just created to an instance of CLLocationManager()
  override init() {
    locationManager = CLLocationManager()
    // TODO: read wtf super.init() does
    super.init()
    // ask the user for authorization for location data
    locationManager.requestAlwaysAuthorization()
    // start tracking the user
    locationManager.startUpdatingLocation()
    // ensure that this class is the delegate for the location manager
    locationManager.delegate = self
  }
  // get the results of the location monitoring using 'didUpdateLocation`
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    coordinate = location.coordinate
    
    getCityFrom(coordinates: coordinate)
  }
  
  func getCityFrom(coordinates location: CLLocationCoordinate2D) {
    let url = URL(string: "https://api.bigdatacloud.net/data/reverse-geocode-with-timezone?latitude=\(location.latitude)&longitude=\(location.longitude)&localityLanguage=en&key=ebb3c0a2e65c4bad8549af576d21d713")!
    
    NetworkManager<CityModel>().fetch(for: url) { (result) in
      switch result {
      case .success(let cityData):
        self.cityName = "\(cityData.city), \(cityData.countyCode)"
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
  }
}
