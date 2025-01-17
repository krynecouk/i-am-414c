//
//  TerminalHelpTest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//

import SwiftUI

struct TerminalHelpTest: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let wide: Bool
    
    init(wide: Bool = false) {
        self.wide = wide
    }
    
    var body: some View {
        if helpVM.current == .learn {
            let theme = themeVM.terminal.help.test
            let equation = helpVM.equation
            let resultRadix = equation.builder is ID ? EquationRadix.dec : helpVM.radix
            let items = TerminalTest.getItems(id: UUID(), equation: equation.toString(radix: helpVM.radix, result: (true, resultRadix)))
            TerminalTest(items, theme: (theme.figlet, theme.sign, nil), wide: wide, shadow: true)
        }
    }
}
