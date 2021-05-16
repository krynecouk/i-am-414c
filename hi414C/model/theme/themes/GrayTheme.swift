//
//  GrayTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/213598

import SwiftUI

class GrayTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryGray"), Color("SecondaryGray")),
            secondary: (Color("SecondaryGray"), Color("WhiteGray")),
            tertiary: (Color("TertiaryGray"), Color("SecondaryGray")),
            background: .black
        )) {
        super.init(font: font, color: color)
    }
}
