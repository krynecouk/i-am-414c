//
//  ColorTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

extension Color {
    public static func primary(_ name: String) -> Color {
        Color("Primary\(name)")
    }
    
    public static func secondary(_ name: String) -> Color {
        Color("Secondary\(name)")
    }
    
    public static func tertiary(_ name: String) -> Color {
        Color("Tertiary\(name)")
    }
}
