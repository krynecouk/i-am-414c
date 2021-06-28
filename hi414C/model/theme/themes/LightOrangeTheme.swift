//
//  LightOrangeTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.05.2021.
//

import SwiftUI

class LightOrangeTheme: Theme {
    override var type: ThemeType { .light_orange }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryLightOrange"), Color("SecondaryLightOrange")),
            secondary: (Color("SecondaryLightOrange"), Color("BlackLightOrange")),
            tertiary: (Color("TertiaryLightOrange"), Color("BlackLightOrange")),
            background: Color("WhiteLightOrange")
        )) {
        super.init(font: font, color: color)
        super.terminal.cathode.blurIn = .clear
    }
    
}
