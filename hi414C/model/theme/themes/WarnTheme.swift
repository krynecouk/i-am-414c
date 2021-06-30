//
//  WarnTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 02.06.2021.
//

import SwiftUI

class WarnTheme: Theme {
    override var type: ThemeType { .warn }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryWarn"), Color("SecondaryWarn")),
            secondary: (Color("SecondaryWarn"), Color("WhiteWarn")),
            tertiary: (Color("TertiaryWarn"), Color("WhiteWarn")),
            background: .black
        )) {
        super.init(font: font, color: color)
        self.terminal.grid.message.figlet.animations = [
            .print(dt: 0.4, delay: 0.3),
            .shake(dt: 0.3, force: 3, type: .baba, animation: .none),
            .bloom(speed: 0.3, color: color.primary.value)
        ]
    }
}
