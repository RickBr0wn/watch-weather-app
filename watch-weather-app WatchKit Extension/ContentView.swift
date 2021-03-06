//
//  ContentView.swift
//  watch-weather-app WatchKit Extension
//
//  Created by Rick Brown on 06/03/2021.
//

import SwiftUI

/**
 First task is to set the privacy options.
 Add these 2 properties to the info.plist file:
  Privacy - Location Always and When In Use Usage Description
  Privacy - Location Always Usage Description
 A descripter can be used to explain to the user why.
  eg: Your location is required to give you accurate weather data for your area.
*/

struct ContentView: View {
  var body: some View {
    Text("Hello, World!")
      .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
