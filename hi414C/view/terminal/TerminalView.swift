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

    var body: some View {
            VStack(spacing: 0) {
                TerminalGrid(items: getItems(from: terminalVM.content, ascii: asciiVM.symbols))
                TerminalSegue()
            }
    }
    
    private func getItems(from types: [TerminalContentType], ascii: [ASCIISymbol]) -> [TerminalItem] {
        var items: [TerminalItem] = []
        for type in types {
            if case let .asciiTest(tests) = type {
                let symbols = tests.map { $0.symbol }
                if containsAll(tested: symbols, from: ascii) {
                    items.append(TerminalItem(of: .message(symbols)))
                    testVM.setTest(test: .none)
                    continue
                }
                
                var testWasSetup = false
                tests.forEach { test in
                    let symbol = test.symbol
                    if ascii.contains(symbol) {
                        items.append(TerminalItem(id: "\(test.id.uuidString)\(symbol.rawValue)", of: .symbol(symbol)))
                        return
                    }

                    if testWasSetup {
                        items.append(TerminalItem(id: test.id.uuidString, of: .test(test, false)))
                        return
                    }
                    testWasSetup.toggle()
                    items.append(TerminalItem(id: test.id.uuidString, of: .test(test, true)))
                    testVM.setTest(test: test)
                }
            }
            if case let .asciiArt(arts) = type {
                items.append(TerminalItem(of: .art(arts)))
            }
        }
        return items
    }
    
    private func containsAll(tested: [ASCIISymbol], from symbols: [ASCIISymbol]) -> Bool {
        for symbol in tested {
            if !symbols.contains(symbol) {
                return false
            }
        }
        return true
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
            .withEnvironment()
    }
}
