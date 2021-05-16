//
//  VintageTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/220248

import SwiftUI

class VintageTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryVintage"), Color("SecondaryVintage")),
            secondary: (Color("SecondaryVintage"), Color("WhiteVintage")),
            tertiary: (Color("TertiaryVintage"), Color("WhiteVintage")),
            background: Color("SecondaryVintage")
        )) {
        super.init(font: font, color: color)
    }
}
