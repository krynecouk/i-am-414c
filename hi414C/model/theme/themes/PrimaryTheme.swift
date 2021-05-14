//
//  PrimaryTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.05.2021.
//  palette: https://colorhunt.co/palette/192064
//

import SwiftUI

class PrimaryTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryOrange"), Color("SecondaryOrange")),
            secondary: (Color("SecondaryOrange"), Color("WhiteOrange")),
            tertiary: (Color("TertiaryOrange"), Color("WhiteOrange")),
            background: Color.black
        )) {
        super.init(font: font, color: color)
    }
    
}
