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
            primary: (Color("PrimaryOrange"), Color("BlackBck")),
            secondary: (Color("BlackBck"), Color("BackgroundOrange")),
            tertiary: (Color("SecondaryOrange"), Color("SecondaryOrange")),
            background: Color.black
        )) {
        super.init(font: font, color: color)
    }
    
}
