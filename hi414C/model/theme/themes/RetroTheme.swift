//
//  RetroTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/264401

import SwiftUI

class RetroTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryRetro"), Color("SecondaryRetro")),
            secondary: (Color("SecondaryRetro"), Color("WhiteRetro")),
            tertiary: (Color("TertiaryRetro"), Color("BlackRetro")),
            background: Color("SecondaryRetro")
        )) {
        super.init(font: font, color: color)
    }
}
