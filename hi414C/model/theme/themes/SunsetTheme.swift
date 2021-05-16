//
//  SunsetTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/100885

import SwiftUI

class SunsetTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimarySunset"), Color("SecondarySunset")),
            secondary: (Color("SecondarySunset"), Color("WhiteSunset")),
            tertiary: (Color("TertiarySunset"), Color("WhiteSunset")),
            background: Color("SecondarySunset")
        )) {
        super.init(font: font, color: color)
    }
}
