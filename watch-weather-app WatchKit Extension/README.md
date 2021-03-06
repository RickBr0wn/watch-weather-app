#  Notes
## https://lil.software/api/
## https://api.lil.software/weather?latitude=40.709335&longitude=-73.956558

1. Set the privacy options.
      Add these 2 properties to the info.plist file:
        `Privacy - Location Always and When In Use Usage Description`
        `Privacy - Location Always Usage Description`
      A descripter is used to explain to the user why.
        eg: "Your location is required to give you accurate weather data for your area."

2. Create a generic `Network Manager` for API calls. 
      `NetworkManager.swift`
  
  3. Create models.
        `WeatherResponse`
        `WeatherModel`
        `WeatherCoordinates`
  
  4. Create a weatherManager using the NetworkManager to make the API call.
        `WeatherManager` will publish the information from the API, using the networkManager

  5. Create a locationManager to provide the coordinates to the weatherManager.
        `LocationManager`

  6. 
