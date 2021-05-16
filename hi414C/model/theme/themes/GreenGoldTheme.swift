//
//  GreenGoldTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.05.2021.
//  palette: https://colorhunt.co/palette/258333

import SwiftUI

class GreenGoldTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryGreenGold"), Color("SecondaryGreenGold")),
            secondary: (Color("SecondaryGreenGold"), Color("BlackLightGreenGold")),
            tertiary: (Color("TertiaryGreenGold"), Color("BlackLightGreenGold")),
            background: Color("WhiteGreenGold")
        )) {
        super.init(font: font, color: color)
    }
    
}
