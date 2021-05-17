//
//  ForestTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette:

import SwiftUI

class ForestTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryForest"), Color("SecondaryForest")),
            secondary: (Color("SecondaryForest"), Color("WhiteForest")),
            tertiary: (Color("TertiaryForest"), Color("WhiteForest")),
            background: Color("SecondaryForest")
        )) {
        super.init(font: font, color: color)
    }
}
