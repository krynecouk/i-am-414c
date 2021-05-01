//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//
import SwiftUI

struct TerminalHelp: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let item: TerminalHelpItem
    let wide: Bool
    
    init(_ item: TerminalHelpItem, wide: Bool = false) {
        print("TerminalHelp")
        self.item = item
        self.wide = wide
    }
    
    var body: some View {
        if case let .test(test) = item.type {
            let (id, equation) = getTestData(from: test)
            let theme = themeVM.terminal.help.test.active
            TerminalTest(TerminalTest.getItems(id: id, equation: equation.toString(result: (true, .dec))), theme: (theme.figlet, theme.sign), wide: wide)
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
            TerminalMessage(text, theme: themeVM.terminal.help.message.figlet)
            TerminalAnswer(answers)
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
