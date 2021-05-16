//
//  SummerTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/257808

import SwiftUI

class SummerTheme: Theme {
    
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimarySummer"), Color("SecondarySummer")),
            secondary: (Color("SecondarySummer"), Color("WhiteSummer")),
            tertiary: (Color("TertiarySummer"), Color("BlackSummer")),
            background: Color("SecondarySummer")
        )) {
        super.init(font: font, color: color)
    }
    
}
