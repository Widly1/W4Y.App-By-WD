//
//  WeatherRow.swift
//  Wids-WeatherApp
//
//  Created by Widly D. on 2/26/24.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: logo)
                .font(.title)
                .frame(width: 30, height: 30)
                .padding()
                .background(LinearGradient(colors: [.teal ,.white, .yellow, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(name)
                    .font(.callout)
                    .bold()
                
                Text(value)
                    .bold()
                    .font(.title2)
            }
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer.medium", name: "Feels like", value: "15°")
}
