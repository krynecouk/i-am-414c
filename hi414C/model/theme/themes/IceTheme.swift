//
//  IceTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/180289

import SwiftUI

class IceTheme: Theme {
    override var type: ThemeType { .ice }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryIce"), Color("SecondaryIce")),
            secondary: (Color("SecondaryIce"), Color("WhiteIce")),
            tertiary: (Color("TertiaryIce"), Color("WhiteIce")),
            background: Color("SecondaryIce")
        )) {
        super.init(font: font, color: color)
    }
}
