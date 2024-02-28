//
//  WeatherView.swift
//  Weather4You
//
//  Created by Widly D. on 2/26/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody

    @State private var isNight = false
        
    var body: some View {
        ZStack(alignment: .topLeading) {
            //Creating a binding $ bool statement for the button "change time of day"  when it is pressed
            BackGroundView( isNight: $isNight)
            VStack {
                VStack (alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today,  \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack {
                        VStack (spacing: 20){
                            Image(systemName: "moon.zzz")
                                .font(.system(size: 70))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 135, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feels_like.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    
                    Button {
                        //every time the button is pressed a true or false sequence occurs
                        isNight.toggle()
                    } label: {
                        WeatherButton(
                            title: "Change Time of Day",
                            textColor: .black,
                            backgroundColor: Color.white)
                    }
                    
                    Spacer()
                        .frame(height: 24)
                    
                    AsyncImage(url: URL(string: "https://picsum.photos/450/270")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 25)
                .foregroundColor(Color.black)
                .background(LinearGradient(
                    gradient: Gradient(colors: [isNight ? .gray : Color(hue: 0.583, saturation: 0.839, brightness: 0.977, opacity: 0.813),
                        isNight ? .gray : .white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
                .cornerRadius(28, corners: [.topLeft, .topRight])
                
            }
                        
        }
        .edgesIgnoringSafeArea(.bottom).background(LinearGradient(colors: [.teal, .white],
            startPoint: .topLeading,
            endPoint: .bottomTrailing))
        .preferredColorScheme(.light)
    }
}

struct BackGroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .gray : Color(hue: 0.583, saturation: 0.839, brightness: 0.977, opacity: 0.813) ,
            isNight ? .black: .white]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
       .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
