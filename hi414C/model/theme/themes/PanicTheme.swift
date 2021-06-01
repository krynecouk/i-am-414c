//
//  PanicTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.06.2021.
//

import SwiftUI

class PanicTheme: Theme {
    override var type: ThemeType { .panic }
    override init(
        font: FontTheme = FontTheme(),
        color: ColorTheme = ColorTheme(
            primary: (Color("PrimaryPanic"), Color("SecondaryPanic")),
            secondary: (Color("SecondaryPanic"), Color("WhitePanic")),
            tertiary: (Color("TertiaryPanic"), Color("BlackPanic")),
            background: Color("SecondaryPanic")
        )) {
        super.init(font: font, color: color)
        self.terminal.grid.test.active.figlet.typeface = .ansi(.shadow)
        self.terminal.grid.symbol.typeface = .ansi(.shadow)
        self.terminal.grid.message.figlet.typeface = .ansi(.shadow)
        self.terminal.grid.message.figlet.animations = [.shake(speed: 0.3, force: 3, type: .baba, animation: .none)]
    }
}
