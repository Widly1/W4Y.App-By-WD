//
//  WeatherView.swift
//  Weather4You
//
//  Created by Widly D. on 2/26/24.
//

import SwiftUI

// Extension for rounding Double values to a String
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

struct WeatherView: View {
    var weather: ResponseBody

    @State private var isNight = false
       
    var body: some View {
        ZStack(alignment: .topLeading) {
            //Creating a binding $ bool statement for the button "Dark Mode" when it is pressed
            BackGroundView( isNight: $isNight)
            VStack {
                VStack (alignment: .leading, spacing: 5) {
                    if #available(iOS 16.1, *) {
                        Text(weather.name)
                            .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontDesign(.rounded)
                            .fontDesign(.monospaced)
                            .font(.system(size: 45))
                    } else {
                        // Fallback on earlier versions
                    }
                    if #available(iOS 16.0, *) {
                        Text("Today is, \(Date().formatted(.dateTime.month().day().hour().minute().second()))")
                            .fontWeight(.bold)
                            .font(.system(size: 23))
                    } else {
                        // Fallback on earlier versions
                    }

                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack {
                        VStack (spacing: 2){
                            if let weatherDescription = weather.weather.first?.main {
                                Image(systemName: imageForWeatherDescription(weatherDescription))
                                    .resizable()
                                    .frame(width: 85, height: 75)
                                } else {
                                Text("Unknown Weather")
                                }
                        
                            
                            Text(weather.weather[0].main)
                                .font(.system(size: 30))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                        .frame(width: 200, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 67))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                    
                    Button {
                        //every time the button is pressed a true or false sequence occurs
                        isNight.toggle()
                    } label: {
                        DarkModeButton(
                            title: "Dark Mode",
                            textColor: .black,
                            backgroundColor: Color.white)
                    }
                    
                    Spacer()
                        .frame(height: 24)
                    
                    AsyncImage(url: URL(string: "https://source.unsplash.com/620x470/?hypercars")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, alignment: .center)
                            .cornerRadius(15)
                    }
                placeholder: {
                    ProgressView()
                }
                
                Spacer()
                
                    
               }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                if #available(iOS 16.1, *) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Weather Info")
                            .bold().padding(.bottom)
                        
                        HStack{
                            WeatherRow(logo: "thermometer.medium" , name: "Min. Temp.", value: (weather.main.tempMin.roundDouble() + "°"))
                            Spacer()
                            WeatherRow(logo: "thermometer.medium" , name: "Max. Temp.", value: (weather.main.tempMax.roundDouble() + "°"))
                        }
                        HStack{
                            WeatherRow(logo: "wind.circle" , name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                            Spacer()
                            WeatherRow(logo: "humidity.fill" , name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .fontDesign(.monospaced)
                    .padding(.bottom, 30)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(
                     gradient: Gradient( colors:
                     [isNight ? .gray : Color(hue: 0.583, saturation: 0.839, brightness: 0.977, opacity: 0.813),
                      isNight ? .gray : .blue, .gray ]),
                      startPoint: .topLeading,
                      endPoint: .bottomTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                } else {
                    // Fallback on earlier versions
                }
               
                
            }
                        
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(LinearGradient(colors: [.blue, .white,.white, .blue],
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .preferredColorScheme(.dark)
    }
}

    struct BackGroundView: View {
        
        @Binding var isNight: Bool
        
        var body: some View {
            LinearGradient(gradient: Gradient(colors: [isNight ? .gray : Color(hue: 0.583, saturation: 0.839, brightness: 0.977, opacity: 0.813) , isNight ? .black: .blue, .white, .clear]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
    
    // a function (string switch case)for the image description that should automatically change the image use for the weather based off the weather description & JSON data \\
    
    //PS. This is all the weather I can think of based off different locations in the world. \\
    
func imageForWeatherDescription(_ description: String) -> String {
    switch description {
    case "Clear sky":
        return "sun.max.fill"
    case "Clear":
        return "sun.max.fill"
    case "Clouds":
        return "cloud.sun.fill"
    case "Few clouds":
        return "cloud.sun.fill"
    case "Cloudy":
        return "cloud.fill"
    case "Drizzle":
        return "cloud.drizzle.fill"
    case "Sunrise":
        return "sunrise.fill"
    case "Sunset":
        return "sunset.fill"
    case "Raining":
        return "cloud.rain.fill"
    case "Heavy rain":
        return "cloud.heavyrain.fill"
    case "Light rain":
        return "sun.rain.fill"
    case "Light snow":
        return "sun.snow"
    case "Heavy snow":
        return "cloud.snow.fill"
    case "Hail":
        return "cloud.hail.fill"
    case "Foggy":
        return "cloud.fog.fill"
    case "Thunderstorms with Heavy Rain":
        return "cloud.bolt.rain.fill"
    case "Windy":
        return "wind"
    case "Hurricane":
        return "hurricane.circle.fill"
    case "Tropical storm":
        return "tropicalstorm.circle.fill"
    default:
        return "questionmark.circle.fill" // Default system image if no match found
    }
}
    
    
    #Preview {
        WeatherView(weather: previewWeather)
    }

