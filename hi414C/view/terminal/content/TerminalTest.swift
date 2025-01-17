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
        num: FigletTheme,
        sign: FigletTheme,
        unknown: FigletTheme?
    )
    let wide: Bool
    let shadow: Bool
    
    init(_ items: [TerminalTestItem], theme: (FigletTheme, FigletTheme, FigletTheme?), wide: Bool = false, shadow: Bool = false) {
        self.items = items
        self.theme = theme
        self.wide = wide
        self.shadow = shadow
    }
    
    var body: some View {
        ForEach(items, id: \.id) { item in
            if case let .num(chars) = item.type {
                DetailRow(of: chars, wide: wide) {
                    LiteFigletView(String(chars), theme: theme.num, shadow: self.shadow)
                }
            }
            if case let .sign(chars) = item.type {
                DetailRow(of: chars, wide: wide) {
                    LiteFigletView(String(chars), theme: theme.sign, shadow: self.shadow)
                }
            }
            if case let .hint(chars) = item.type {
                ForEach(chars.map { Item($0) }) { item in
                    if TerminalTest.isEquationSign(item.content) {
                        LiteFigletView(String(item.content), theme: theme.sign, shadow: self.shadow)
                    } else if item.content == "?" {
                        FigletView(String(item.content), theme: theme.unknown!, shadow: false)
                    } else {
                        LiteFigletView(String(item.content), theme: theme.num, shadow: self.shadow)
                    }
                }
            }
        }
    }
    
    public static func getItems(id: UUID, equation: String) -> [TerminalTestItem] {
        print("getting test items eq: ", equation)
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
        return items
    }
    
    public static func getItems(from test: Test, radix: EquationRadix) -> [TerminalTestItem] {
        getItems(id: test.id, equation: test.equation.toString(radix: radix))
    }
    
    public static func getItems(from hint: EquationHint, radix: EquationRadix) -> [TerminalTestItem] {
        [TerminalTestItem(of: .hint(Array(hint.of(radix: radix).toString(radix: (body: .dec, result: .dec)))))]
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
    case hint([Character])
}
