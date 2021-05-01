//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//
import SwiftUI

struct TerminalHelp: View {
    @EnvironmentObject var helpVM: HelpViewModel
    
    let item: TerminalHelpItem
    let theme: FigletTheme
    let wide: Bool
    
    init(_ item: TerminalHelpItem, _ theme: FigletTheme = FigletTheme(), wide: Bool = false) {
        print("TerminalHelp")
        self.item = item
        self.theme = theme
        self.wide = wide
    }
    
    var body: some View {
        if case let .test(test) = item.type {
            let (id, equation) = getTestData(from: test)
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
                    helpVM.setOriginalEq(id: test.id, equation: test.equation)
                    helpVM.removeUpdatedEq()
                }
            }
        }
        if case let .message(text, answers) = item.type {
            if helpVM.isHistory {
                TerminalHistory()
            }
            
            TerminalMessage(text, theme: FigletTheme(
                typeface: .ansi(.shadow),
                view: ViewTheme(
                    color: .black
                ),
                animations: []
            ))
            
            TerminalMessageGenerator()
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

struct TerminalHelpItem: Identifiable {
    var id: UUID
    var type: TerminalHelpType
    
    init(id: UUID = UUID(), of type: TerminalHelpType) {
        self.id = id
        self.type = type
    }
}

enum TerminalHelpType {
    case test(Test)
    case message(String, Answers)
}
