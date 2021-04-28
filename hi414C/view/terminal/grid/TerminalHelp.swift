//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//
import SwiftUI

struct TerminalHelp: View {
    
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
            let types = test.equation.types.count > 1 ? test.equation.types.filter { $0 != .ID } : test.equation.types
            ForEach(Array(types), id: \.self) { type in
                //let equation = type.build().eq(UInt8.random(in: 0...128))
                TerminalTest(TerminalTest.getItems(id: test.id, equation: test.equation.toString(result: (true, type == .ID ? .dec : .bin))), theme:
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
            }
        }

    }
}

enum TerminalHelpType {
    case test(Test)
    case message([Message])
}
