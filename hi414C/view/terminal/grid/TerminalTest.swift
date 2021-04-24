//
//  TerminalTest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.04.2021.
//

import SwiftUI

typealias Span = (small: Int, big: Int)

struct TerminalTest: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    let items: [TerminalTestItem]
    let theme: (
        num: LiteFigletTheme,
        sym: FigletTheme
    )
    let wide: Bool

    init(_ items: [TerminalTestItem], theme: (LiteFigletTheme, FigletTheme), wide: Bool = false) {
        print("TerminalTest")
        self.items = items
        self.theme = theme
        self.wide = wide
    }
    
    var body: some View {
        ForEach(Array(items.enumerated()), id: \.offset) { i, item in
            if case let .num(char) = item.type {
                LiteFigletView(String(char), theme: theme.num)
            }
            if case let .sym(char, span) = item.type {
                FigletView(String(char), theme: theme.sym)
                if uiVM.isDetail {
                    if wide {
                        ForEach(0 ..< span.big) { _ in
                            Color.clear
                        }
                    } else {
                        ForEach(0 ..< span.small) { _ in
                            Color.clear
                        }
                    }
                }
            }
        }
    }
    
    public static func getItems(from test: Test) -> [TerminalTestItem] {
        print("Calculating Test Items")
        var items: [TerminalTestItem] = []
        let chars = test.equation.toString().map { $0 }
        var consecutiveOps = 0
        for (i, char) in chars.enumerated() {
            if isOperator(char) {
                if chars.endIndex > (i + 1) && isOperator(chars[i + 1]) {
                    items.append(TerminalTestItem(id: test.id, of: .sym(char, (0, 0))))
                    consecutiveOps += 1
                } else {
                    items.append(TerminalTestItem(id: test.id, of: .sym(char, (3 - (consecutiveOps % 4), 7 - (consecutiveOps % 8)))))
                    consecutiveOps = 0
                }
            } else {
                items.append(TerminalTestItem(id: test.id, of: .num(char)))
            }
        }
        return items
    }

    public static func isOperator(_ char: Character) -> Bool {
        ["+", "-", "/", "*", "&", "|", "^", "~", "<", ">", ")", "("].contains(char)
    }
}

struct TerminalTestItem: Identifiable {
    var id: UUID
    var type: TerminalTestType
    
    init(id: UUID = UUID(), of type: TerminalTestType) {
        self.id = id
        self.type = type
    }
}

enum TerminalTestType {
    case num(Character)
    case sym(Character, Span)
}
