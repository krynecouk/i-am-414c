//
//  LightBlueTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.05.2021.
//

import SwiftUI

class LightBlueTheme: Theme {
    override var type: ThemeType { .light_blue }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryLightBlue"), Color("SecondaryLightBlue")),
            secondary: (Color("SecondaryLightBlue"), Color("BlackLightBlue")),
            tertiary: (Color("TertiaryLightBlue"), Color("BlackLightBlue")),
            background: Color("WhiteLightBlue")
        )) {
        super.init(font: font, color: color)
    }
    
}
