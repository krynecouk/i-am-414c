//
//  YellowTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette:

import SwiftUI

class YellowTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryYellow"), Color("SecondaryYellow")),
            secondary: (Color("SecondaryYellow"), Color("WhiteYellow")),
            tertiary: (Color("TertiaryYellow"), Color("WhiteYellow")),
            background: .black
        )) {
        super.init(font: font, color: color)
    }
}
