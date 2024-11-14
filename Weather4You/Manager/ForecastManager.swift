//
//  ForecastManager.swift
//  Weather4You
//
//  Created by Widly D. on 3/4/24.
//

import Foundation
import CoreLocation

class ForecastManager {
    func getDailyForecast(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> [WeatherData.DailyForecast] {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=hourly,minutely,current&appid=\("3ff77e7b51c15385163313b00945aa63")&units=imperial") else {
            fatalError("Missing URL")
        }
       
       // func getDayOfWeek(from timestamp: Int) -> String {
       //   let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
       //   let dateFormatter = DateFormatter()
       //   dateFormatter.dateFormat = "EEEE"//"EEEE"= full name of the day (e.g., "Monday")
       //   return dateFormatter.string(from: date)
       // }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error getting weather data")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
        
        return decodedData.daily
    }
}

// JSON DATA
struct WeatherData: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var daily: [DailyForecast] // Add daily forecast data

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable { // Nested struct remains as WeatherResponse
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Int
        var feels_like: Int
        var temp_min: Int
        var temp_max: Int
        var pressure: Int
        var humidity: Int
    }

    struct WindResponse: Decodable {
        var speed: Double
        var deg: Int
    }

    struct DailyForecast: Decodable {
        var dt: Int
        var temp: Temperature
        var weather: [WeatherResponse]
        var humidity: Int
        var wind_speed: Double
        
        struct Temperature: Decodable {
            var day: Double
            var min: Int
            var max: Int
            var night: Int
            var eve: Int
            var morn: Int
        }
    }

}

