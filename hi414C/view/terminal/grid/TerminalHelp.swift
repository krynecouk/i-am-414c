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
            let id = getId(test: test)
            let equation = getEquation(test: test)
            TerminalTest(TerminalTest.getItems(id: id, equation: equation.toString(result: (true, .dec))), theme:
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
                    helpVM.originalEq = HelpEquation(id: test.id, equation: test.equation)
                    helpVM.updatedEq = nil
                }
            }
        }
    }
    
    func getId(test: Test) -> UUID {
        if helpVM.originalEq.id != test.id {
            return test.id
        } else {
            if helpVM.updatedEq != nil {
                return helpVM.updatedEq!.id
            } else {
                return test.id
            }
        }
    }
    
    func getEquation(test: Test) -> Equation {
        if helpVM.originalEq.id != test.id {
            return test.equation
        } else {
            if helpVM.updatedEq != nil {
                return helpVM.updatedEq!.equation
            } else {
                return test.equation
            }
        }
    }
}

enum TerminalHelpType {
    case test(Test)
    case message([Message])
}
