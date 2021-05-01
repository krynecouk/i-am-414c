//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//
import SwiftUI

struct TerminalHelpTest: View {
    @EnvironmentObject var helpVM: HelpViewModel
    
    let test: Test
    let theme: FigletTheme
    let wide: Bool
    
    init(_ test: Test, _ theme: FigletTheme = FigletTheme(), wide: Bool = false) {
        print("TerminalHelp")
        self.test = test
        self.theme = theme
        self.wide = wide
    }
    
    var body: some View {
            let (id, equation) = getTestData(from: test)
            return TerminalTest(TerminalTest.getItems(id: id, equation: equation.toString(result: (true, .dec))), theme:
                            (
                                LiteFigletTheme(
                                    view: ViewTheme(
                                        color: .black
                                    )
                                ),
                                FigletTheme(
                                    view: ViewTheme(
                                        color: .gray
                                    ),
                                    animations: []
                                )), wide: wide
            )
            .onAppear {
                if helpVM.originalEq.id != test.id {
                    helpVM.setOriginalEq(id: test.id, equation: test.equation)
                    helpVM.removeUpdatedEq()
                }
            }
    }
    
    func getTestData(from test: Test) -> (id: UUID, equation: Equation) {
        if helpVM.originalEq.id != test.id || helpVM.updatedEq == nil {
            return (test.id, test.equation)
        } else {
            return (helpVM.updatedEq!.id, helpVM.updatedEq!.equation)
        }
    }
}
