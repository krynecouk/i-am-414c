//
//  LightOrangeTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.05.2021.
//

import SwiftUI

class LightOrangeTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryLightOrange"), Color("SecondaryLightOrange")),
            secondary: (Color("SecondaryLightOrange"), .black),
            tertiary: (Color("TertiaryLightOrange"), .black),
            background: Color("WhiteLightOrange")
        )) {
        super.init(font: font, color: color)
    }
    
}
