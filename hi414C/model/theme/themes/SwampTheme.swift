//
//  SwampTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/147179

import SwiftUI

class SwampTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimarySwamp"), Color("SecondarySwamp")),
            secondary: (Color("SecondarySwamp"), Color("WhiteSwamp")),
            tertiary: (Color("TertiarySwamp"), Color("WhiteSwamp")),
            background: Color("SecondarySwamp")
        )) {
        super.init(font: font, color: color)
    }
}
