//
//  PastelTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/265106

import SwiftUI

class PastelTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryPastel"), Color("SecondaryPastel")),
            secondary: (Color("SecondaryPastel"), Color("WhiteOrange")),
            tertiary: (Color("TertiaryPastel"), Color("WhiteOrange")),
            background: Color("SecondaryPastel")
        )) {
        super.init(font: font, color: color)
    }
    
}
