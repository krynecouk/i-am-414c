//
//  SeaTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette: https://colorhunt.co/palette/273518

import SwiftUI

class SeaTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimarySea"), Color("SecondarySea")),
            secondary: (Color("SecondarySea"), Color("WhiteSea")),
            tertiary: (Color("TertiarySea"), Color("BlackSea")),
            background: Color("SecondarySea")
        )) {
        super.init(font: font, color: color)
    }
}
