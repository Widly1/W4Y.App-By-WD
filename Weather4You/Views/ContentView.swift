//
//  ContentView.swift
//  Weather4You
//
//  Created by Widly D. on 2/26/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather : ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location =
                locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longtitude: location.longitude)
                                
                            } catch {
                                print("Error fetching weather data: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading{
                    LoadingView()
                } else {
                    WelcomeView()
                    .environmentObject(locationManager)
                }
                    
            }
            
        }
        .background(LinearGradient(colors: [.teal, .white, .teal, .indigo, .mint, .yellow, .mint], startPoint: .topLeading, endPoint: .bottomTrailing))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
