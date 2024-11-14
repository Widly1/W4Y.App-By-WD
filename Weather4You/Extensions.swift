//
//  Extensions.swift
//  Weather4You
//
//  Created by Widly D. on 2/26/24.
//

import Foundation
import SwiftUI


extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension View {
  //  func cornerRadius (_ radius: CGFloat, corners: //UIRectCorner) -> some View {
       // clipShape(RoundedCorner )
    }
//}

//struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
   // var corners: UICorner = .allCorners
    
    //func path(in rect: CGRect) -> Path {
 //       let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, // cornerRadii: CGSize(width: radius, height: radius))
   //     return Path(path.cgPath)
  // }
//}
