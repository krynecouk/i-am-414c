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
    
    let test: Test
    let wide: Bool
    
    init(_ test: Test, wide: Bool = false) {
        print("TerminalHelp")
        self.test = test
        self.wide = wide
    }
    
    var body: some View {
        let theme = themeVM.terminal.help.test.active
        let equation = helpVM.equation
        let resultRadix = equation.builder is ID ? EquationRadix.dec : helpVM.radix
        TerminalTest(TerminalTest.getItems(id: UUID(), equation: equation.toString(radix: helpVM.radix, result: (true, resultRadix))), theme: (theme.figlet, theme.sign), wide: wide)
    }
}
