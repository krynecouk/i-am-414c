//
//  FooTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.05.2021.
//  palette:

import SwiftUI

class FooTheme: Theme {

    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryFoo"), Color("SecondaryFoo")),
            secondary: (Color("SecondaryFoo"), Color("WhiteFoo")),
            tertiary: (Color("TertiaryFoo"), Color("BlackFoo")),
            background: Color("SecondaryFoo")
        )) {
        super.init(font: font, color: color)
    }
}
