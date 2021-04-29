//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//
import SwiftUI

struct TerminalHelp: View {
    @EnvironmentObject var helpVM: HelpViewModel
    
    let type: TerminalHelpType
    let theme: FigletTheme
    let wide: Bool
    
    init(_ type: TerminalHelpType, _ theme: FigletTheme = FigletTheme(), wide: Bool = false) {
        print("TerminalHelp")
        self.type = type
        self.theme = theme
        self.wide = wide
    }
    
    var body: some View {
        if case let .test(test) = type {
            let equation = helpVM.equation.value
            TerminalTest(TerminalTest.getItems(id: test.id, equation: equation.toString(result: (true, .dec))), theme:
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
                                ))
            )
            .onAppear {
                if helpVM.equation.id != test.id {
                    helpVM.setEquation(id: test.id, value: test.equation)
                }
            }
        }
        
    }
}

enum TerminalHelpType {
    case test(Test)
    case message([Message])
}
