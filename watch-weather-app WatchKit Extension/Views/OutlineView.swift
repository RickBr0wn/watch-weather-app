//
//  OutlineView.swift
//  watch-weather-app WatchKit Extension
//
//  Created by Rick Brown on 07/03/2021.
//

import SwiftUI

struct OutlineView: View {
  var body: some View {
    RoundedRectangle(cornerRadius: 10.0)
      .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4)
      .padding()
  }
}

struct OutlineView_Previews: PreviewProvider {
  static var previews: some View {
    OutlineView()
  }
}
