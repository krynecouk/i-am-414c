//
//  OrangeTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.05.2021.
//

import SwiftUI

class OrangeTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("Primary"), Color("BlackBck")),
            secondary: (Color("SecondaryOrange"), Color("BackgroundOrange")),
            tertiary: (Color("TertiaryOrange"), Color("BackgroundOrange")),
            background: Color.black
        )) {
        super.init(font: font, color: color)
    }
    
}
