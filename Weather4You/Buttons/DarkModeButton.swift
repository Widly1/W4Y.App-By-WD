//
//  WeatherButton.swift
//  Weather4You
//
//  Created by Widly D. on 2/27/24.
//

import SwiftUI

struct DarkModeButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View
    {
        Text(title)
            .frame(width: 190, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(10)
        
    }
}
