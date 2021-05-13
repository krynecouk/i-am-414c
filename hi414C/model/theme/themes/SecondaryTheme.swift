//
//  SecondaryTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.05.2021.
//

import SwiftUI

class SecondaryTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: Color.blue,
            secondary: Color.green,
            tertiary: Color.red,
            background: Color.white
        )) {
        super.init(font: font, color: color)
    }
    
}
