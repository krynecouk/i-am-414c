//
//  GreenTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.05.2021.
//  palette: https://colorhunt.co/palette/264502, https://colorhunt.co/palette/281939

import SwiftUI

class GreenTheme: Theme {
    override var type: ThemeType { .green }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryGreen"), Color("SecondaryGreen")),
            secondary: (Color("SecondaryGreen"), Color("WhiteGreen")),
            tertiary: (Color("TertiaryGreen"), Color("WhiteGreen")),
            background: .black
        )) {
        super.init(font: font, color: color)
    }
    
}
