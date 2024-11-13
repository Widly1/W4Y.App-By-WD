//
//  WeatherView.swift
//  Weather4You
//
//  Created by Widly D. on 2/26/24.
//

import SwiftUI

struct ForecastView: View {
    
    var weather: ResponseBody
    
    @State private var isNight = false
    
    var body: some View {
                ZStack(alignment: .topLeading) {
                    //Creating a binding $ bool statement for the button "Dark mode button" when it is pressed
                    SecondBackGroundView( isNight: $isNight)
                    VStack {
                        VStack (alignment: .leading , spacing: 2) {
                            Text(weather.name)
                                .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            
                            Text("Today is, \(Date().formatted(.dateTime.month().day().hour().minute().second()))")
                                .fontWeight(.bold)
                                .font(.system(size: 23, design: .rounded))
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        
                        Spacer()
                        
                        VStack{
                            HStack {
                                VStack (spacing: 8){
                                    Image(systemName: "cloud.moon.fill")
                                        .font(.system(size: 70))
                                    
                                    Text(weather.weather[0].main)
                                }
                                .frame(width: 100, alignment: .leading)
                                
                                Spacer()
                                
                                Text(weather.main.feels_like.roundDouble() + "°")
                                    .font(.system(size: 100))
                                    .fontWeight(.bold)
                                    .padding()
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
                                .frame(height: 29)
                            
                            AsyncImage(url: URL(string: "https://source.unsplash.com/600x370/?hypercars")) { image in image
                                    .resizable()
                                //.aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                    .frame(width: 369, height: 210, alignment: .centerLastTextBaseline)
                            }
                        placeholder: {
                            ProgressView()
                        }
                            
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        Spacer()
                        
                        VStack( alignment: .center, spacing: 40)
                        {
                    
                            HStack{
                            DaysView(dayOfWeek: "WED",
                            maxtemperature: 76,
                            mintemperature: 71,
                            imageName: "sun.rain.fill",
                            weatherType: " Heavy ",
                            weatherType2: " Rain ")
                                
                                                        
                            DaysView(dayOfWeek: "THU",
                            maxtemperature: 73,
                            mintemperature: 67,
                            imageName: "cloud.drizzle.fill",
                            weatherType: "Rainy",
                            weatherType2: " "
                            )
                                                        
                            DaysView(dayOfWeek: "FRI",
                            maxtemperature: 77,
                            mintemperature: 72,
                            imageName: "cloud.fill",
                            weatherType: "Cloudy",
                            weatherType2: " ")
                                                        
                            DaysView(dayOfWeek: "SAT",
                            maxtemperature: 80,
                            mintemperature: 71,
                            imageName: "cloud.sun.fill",
                            weatherType: "Sunny",
                            weatherType2: " ")
                                                        
                            // DaysView(dayOfWeek: "SUN",
                            // maxtemperature: 76,
                             //mintemperature: 73,
                             //imageName: "cloud.bolt.rain.fill",
                             //weatherType: "Storming")
                                                        
                                }
                            

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.bottom, 25)
                        .foregroundColor(Color.black)
                        .background(LinearGradient(
                            gradient: Gradient(colors: [isNight ? .gray : Color(hue: 0.583, saturation: 0.839, brightness: 0.967, opacity: 0.813), isNight ? .gray : .black]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                        .cornerRadius(28, corners: [.topLeft, .topRight])
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.bottom).background(LinearGradient(colors: [.teal, .white],startPoint: .topLeading,
                    endPoint: .bottomTrailing))
                .preferredColorScheme(.dark)
            }
        }

// Our structures used:


struct DaysView: View {
    
    var dayOfWeek: String
    var maxtemperature: Int
    var mintemperature: Int
    var imageName: String
    var weatherType: String
    var weatherType2: String
    
    var body: some View {
        VStack {
            Text (dayOfWeek)
                .font(.system(size: 23, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            
            Text (weatherType)
                .font(.system(size: 23, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 85, alignment: .center)
            
            //created this second weather type for text alignment
            // just so everything can be on the same line
            Text (weatherType2)
                .font(.system(size: 23, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 60, alignment: .center)
            
            Image (systemName: imageName)
                .renderingMode(.original)
                .resizable ()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            Text ("High: \(maxtemperature) °")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
                .frame(alignment: .center)
            
            Text ("Low: \(mintemperature) °")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
                .frame(alignment: .center)
        }
    }
}

    struct SecondBackGroundView: View {
        
        @Binding var isNight: Bool
        
        var body: some View {
            LinearGradient(gradient: Gradient(colors: [isNight ? .gray : Color(hue: 0.583, saturation: 0.839, brightness: 0.977, opacity: 0.813) , isNight ? .black: .black, .black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }

#Preview {
    ForecastView(weather: previewWeather)
}
