//
//  BananaSkyTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/180404

import SwiftUI

class BananaSkyTheme: Theme {
    override var type: ThemeType { .bananaSky }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryBananaSky"), Color("SecondaryBananaSky")),
            secondary: (Color("SecondaryBananaSky"), Color("WhiteBananaSky")),
            tertiary: (Color("TertiaryBananaSky"), Color("WhiteBananaSky")),
            background: Color("SecondaryBananaSky")
        )) {
        super.init(font: font, color: color)
    }
}
