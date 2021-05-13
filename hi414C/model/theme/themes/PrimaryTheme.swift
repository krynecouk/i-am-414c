//
//  PrimaryTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.05.2021.
//

import SwiftUI

class PrimaryTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color.primary, Color("BlackBck")),
            secondary: (Color("BlackBck"), Color.white),
            tertiary: (Color.gray, Color.white),
            background: Color.black
        )) {
        super.init(font: font, color: color)
    }
    
}
