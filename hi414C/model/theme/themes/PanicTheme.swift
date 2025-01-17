//
//  PanicTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.06.2021.
//

import SwiftUI

class PanicTheme: Theme {
    override var type: ThemeType { .panic }
    init(font: FontTheme, color: ColorTheme, styled: Bool = false) {
        super.init(font: font, color: color)
        if styled {
            self.terminal.grid.test.figlet.typeface = .ansi(.shadow)
            self.terminal.grid.test.figlet.typeface = .ansi(.shadow)
        }

        self.terminal.grid.message.figlet.animations = [
            .print(dt: 0.4, delay: 0.3),
            .shake(dt: 0.3, force: 3, type: .baba, animation: .none),
            .bloom(speed: 0.3, color: color.primary.value)
        ]
    }
}
