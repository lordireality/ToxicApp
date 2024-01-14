//
//  ColorExtension.swift
//  ToxicApp
//
//  Created by Герман Зыкин on 14.01.2024.
//

import Foundation
import SwiftUI

extension Color {
    public static var outlineRed: Color {
        return Color(decimalRed: 34, green: 0, blue: 3)
    }
    
    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
    }
    
    public static var lightRed: Color {
        return Color(decimalRed: 239, green: 54, blue: 128)
    }
    public static var outlineGreen: Color {
        return Color(decimalRed: 5, green: 34, blue: 0)
    }
    
    public static var darkGreen: Color {
        return Color(decimalRed: 31, green: 221, blue: 49)
    }
    
    public static var lightGreen: Color {
        return Color(decimalRed: 142, green: 239, blue: 54)
    }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
}
