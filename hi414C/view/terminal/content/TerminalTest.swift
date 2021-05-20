//
//  TerminalTest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.04.2021.
//

import SwiftUI

struct TerminalTest: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    let items: [TerminalTestItem]
    let theme: (
        num: LiteFigletTheme,
        sign: LiteFigletTheme
    )
    let wide: Bool
    
    init(_ items: [TerminalTestItem], theme: (LiteFigletTheme, LiteFigletTheme), wide: Bool = false) {
        print("TerminalTest")
        self.items = items
        self.theme = theme
        self.wide = wide
    }
    
    var body: some View {
        ForEach(items, id: \.id) { item in
            if case let .num(chars) = item.type {
                DetailRow(of: chars, wide: wide) {
                    LiteFigletView(String(chars), theme: theme.num)
                }
            }
            if case let .sign(chars) = item.type {
                DetailRow(of: chars, wide: wide) {
                    LiteFigletView(String(chars), theme: theme.sign)
                }
            }
        }
    }
    
    public static func getItems(id: UUID, equation: String) -> [TerminalTestItem] {
        print("Calculating Test Items")
        var items: [TerminalTestItem] = []
        let chars = equation.map { $0 }
        
        var syms: [Character] = []
        var nums: [Character] = []
        for (i, char) in chars.enumerated() {
            if isEquationSign(char) {
                syms.append(char)
                if chars.endIndex > (i + 1) && isEquationSign(chars[i + 1]) {
                    continue
                } else {
                    items.append(TerminalTestItem(id: "\(id)-\(i)", of: .sign(syms)))
                    syms = []
                }
            } else {
                nums.append(char)
                if chars.endIndex > (i + 1) && !isEquationSign(chars[i + 1]) {
                    continue
                } else {
                    items.append(TerminalTestItem(id: "\(id)-\(i)", of: .num(nums)))
                    nums = []
                }
            }
        }
        print(items)
        return items
    }
    
    public static func getItems(from test: Test, radix: EquationRadix) -> [TerminalTestItem] {
        getItems(id: test.id, equation: test.equation.toString(radix: radix))
    }
    
    public static func isEquationSign(_ char: Character) -> Bool {
        ["+", "-", "/", "*", "&", "|", "^", "~", "<", ">", ")", "(", "="].contains(char)
    }
}

struct TerminalTestItem: IdentifiableString {
    var id: String
    var type: TerminalTestType
    
    init(id: String = UUID().uuidString, of type: TerminalTestType) {
        self.id = id
        self.type = type
    }
}

protocol IdentifiableString {
    var id: String { get }
}

enum TerminalTestType {
    case num([Character])
    case sign([Character])
}
