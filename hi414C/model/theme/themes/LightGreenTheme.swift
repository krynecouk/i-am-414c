//
//  LightGreenTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.05.2021.
//

import SwiftUI

class LightGreenTheme: Theme {
    override var type: ThemeType { .light_green }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryLightGreen"), Color("SecondaryLightGreen")),
            secondary: (Color("SecondaryLightGreen"), Color("BlackLightGreen")),
            tertiary: (Color("TertiaryLightGreen"), Color("BlackLightGreen")),
            background: Color("WhiteLightGreen")
        )) {
        super.init(font: font, color: color)
    }
    
}
