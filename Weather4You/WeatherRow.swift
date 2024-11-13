//
//  WeatherRow.swift
//  Weather4You
//
//  Created by Widly D. on 2/26/24.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: logo)
                .font(.title)
                .frame(width: 20, height: 20)
                .padding()
                .background(LinearGradient(colors: [.teal , .cyan, .blue, .clear ,.yellow, .blue], startPoint: .bottomTrailing, endPoint: .topLeading))
                .cornerRadius(60)
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //.padding(.vertical, 2)
                //.padding(.horizontal, -1)
                
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.callout)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text(value)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title2)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    WeatherRow(logo: "thermometer.medium", name: "Feels like", value: "15°")
}
