//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @EnvironmentObject var terminalVM: TerminalViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var testVM: TestViewModel
    
    init() {
        print("TerminalView")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TerminalGrid(items: getItems(from: terminalVM.content, ascii: asciiVM.symbols))
            TerminalSegue()
        }
    }
    
    private func getItems(from types: [TerminalContentType], ascii: [ASCIISymbol]) -> [TerminalItem] {
        print("Calculating Test Content Items")

        var items: [TerminalItem] = []
        for type in types {
            if case let .test(tests) = type {
                let symbols = tests.map { $0.symbol }
                if containsAll(tested: symbols, from: ascii) {
                    items.append(TerminalItem(of: .message(symbols)))
                    testVM.set(test: .none)
                    continue
                }
                
                var testWasSetup = false
                tests.forEach { test in
                    let symbol = test.symbol
                    if ascii.contains(symbol) {
                        items.append(TerminalItem(id: "\(test.id.uuidString)\(symbol.rawValue)", of: .symbol(symbol)))
                        return
                    }
                    
                    let testItems = getItems(from: test)
                    if testWasSetup {
                        items.append(TerminalItem(id: test.id.uuidString, of: .test(test, testItems, false)))
                        return
                    }
                    testWasSetup.toggle()
                    items.append(TerminalItem(id: test.id.uuidString, of: .test(test, testItems, true)))
                    testVM.set(test: test)
                }
            }
            if case let .art(arts) = type {
                items.append(TerminalItem(of: .art(arts)))
            }
        }
        return items
    }
    
    private func getItems(from test: Test) -> [TerminalTestItem] {
        print("Calculating Test Items")
        var items: [TerminalTestItem] = []
        let chars = test.equation.toString().map { $0 }
        var consecutiveOps = 0
        for (i, char) in chars.enumerated() {
            if isOperator(char) {
                if chars.endIndex > (i + 1) && isOperator(chars[i + 1]) {
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
    
    private func isOperator(_ char: Character) -> Bool {
        ["+", "-", "/", "*", "&", "|", "^", "~", "<", ">", ")", "("].contains(char)
    }
}

private func containsAll(tested: [ASCIISymbol], from symbols: [ASCIISymbol]) -> Bool {
    for symbol in tested {
        if !symbols.contains(symbol) {
            return false
        }
    }
    return true
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
            .withEnvironment()
    }
}
