//
//  OranginaTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette:

import SwiftUI

class OranginaTheme: Theme {
    override var type: ThemeType { .orangina }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryOrangina"), Color("SecondaryOrangina")),
            secondary: (Color("SecondaryOrangina"), Color("WhiteOrangina")),
            tertiary: (Color("TertiaryOrangina"), Color("WhiteOrangina")),
            background: Color("SecondaryOrangina")
        )) {
        super.init(font: font, color: color)
    }
}
