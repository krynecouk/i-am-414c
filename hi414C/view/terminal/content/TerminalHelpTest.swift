//
//  TerminalHelpTest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//
import SwiftUI

struct TerminalHelpTest: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let test: Test
    let wide: Bool
    
    init(_ test: Test, wide: Bool = false) {
        print("TerminalHelp")
        self.test = test
        self.wide = wide
    }
    
    var body: some View {
        let (id, equation, radix) = getTestData(from: test)
        let theme = themeVM.terminal.help.test.active
        TerminalTest(TerminalTest.getItems(id: id, equation: equation.toString(radix: radix, result: (true, .dec))), theme: (theme.figlet, theme.sign), wide: wide)
            .onAppear {
                if helpVM.originalEq.id != test.id {
                    helpVM.setOriginalEq(id: test.id, equation: test.equation)
                    helpVM.removeUpdatedEq()
                }
            }
    }
    
    func getTestData(from test: Test) -> (id: UUID, equation: Equation, radix: EquationRadix) {
        if helpVM.originalEq.id != test.id || helpVM.updatedEq == nil {
            helpVM.radix(of: testVM.radix)
            return (test.id, test.equation, testVM.radix)
        } else {
            return (helpVM.updatedEq!.id, helpVM.updatedEq!.equation, helpVM.radix)
        }
    }
}
