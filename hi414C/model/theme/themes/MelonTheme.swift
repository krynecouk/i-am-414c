//
//  MelonTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette:

import SwiftUI

class MelonTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryMelon"), Color("SecondaryMelon")),
            secondary: (Color("SecondaryMelon"), Color("WhiteMelon")),
            tertiary: (Color("TertiaryMelon"), Color("BlackMelon")),
            background: Color("SecondaryMelon")
        )) {
        super.init(font: font, color: color)
    }
}
