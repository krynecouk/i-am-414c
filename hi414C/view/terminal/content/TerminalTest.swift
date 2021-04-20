//
//  TerminalTest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.04.2021.
//

import SwiftUI

typealias Span = (small: Int, big: Int)

struct TerminalTest: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    let test: Test
    let active: Bool
    let items: [TerminalTestItem]
    let animations: [ASCIIArtAnimation]
    
    init(_ test: Test, _ active: Bool = false, animations: [ASCIIArtAnimation] = []) {
        self.test = test
        self.active = active
        self.items = TerminalTest.getItems(from: test)
        self.animations = animations
    }
    
    var body: some View {
        ForEach(Array(items.enumerated()), id: \.offset) { i, item in
            if case let .bin(char) = item.type {
                FigletView(String(char), theme: active
                            ? themeVM.ascii.test.test.active.figlet.withAnimation(animations)
                            : themeVM.ascii.test.test.passive.figlet.withAnimation(animations))
            }
            if case let .op(char, span) = item.type {
                FigletView(String(char), theme: active
                            ? themeVM.ascii.test.test.active.special.withAnimation(animations) // TODO operator
                            : themeVM.ascii.test.test.passive.special.withAnimation(animations))
                if uiVM.isDetail {
                    if uiVM.isWideScreen() {
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
    
    private static func getItems(from test: Test) -> [TerminalTestItem] {
        var items: [TerminalTestItem] = []
        let chars = test.equation.toString().map { $0 }
        var consecutiveOps = 0
        for (i, char) in chars.enumerated() {
            if isOperator(char) {
                if isOperator(chars[i + 1]) {
                    items.append(TerminalTestItem(id: test.id, of: .op(char, (0, 0))))
                    consecutiveOps += 1
                } else {
                    items.append(TerminalTestItem(id: test.id, of: .op(char, (3 - (consecutiveOps % 4), 7 - (consecutiveOps % 8)))))
                    consecutiveOps = 0
                }
            } else {
                items.append(TerminalTestItem(id: test.id, of: .bin(char)))
            }
        }
        return items
    }
    
    private static func isOperator(_ char: Character) -> Bool {
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
    case bin(Character)
    case op(Character, Span)
}
