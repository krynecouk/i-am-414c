//
//  BlueTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.05.2021.
//  palette: https://colorhunt.co/palette/273278

import SwiftUI

class BlueTheme: Theme {
    override var type: ThemeType { .blue }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryBlue"), Color("SecondaryBlue")),
            secondary: (Color("SecondaryBlue"), Color("WhiteBlue")),
            tertiary: (Color("TertiaryBlue"), Color("WhiteBlue")),
            background: Color.black,
            passive: Color("PassiveBlue")
        )) {
        super.init(font: font, color: color)
    }
    
}
