//
//  WeatherButton.swift
//  Weather4You
//
//  Created by Widly D. on 2/27/24.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View
    {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
        
    }
}
