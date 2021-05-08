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
    
    init() {
        print("TerminalView")
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            let (items, message) = getContent(from: terminalVM.content, ascii: asciiVM.symbols)
            TerminalContent(items: items, message: message)
            TerminalFooter()
        }
        .helpEdgeDrag()
    }
    
    private func getContent(from types: [TerminalContentType], ascii: [ASCIISymbol]) -> ([TerminalItem], Message?) {
        print("Calculating Test Content Items")

        var items: [TerminalItem] = []
        for type in types {
            if case let .test(tests) = type {
                let symbols = tests.map { $0.symbol }
                if contains(all: symbols, in: ascii) {
                    let text = symbols.map { $0.rawValue }.joined()
                    let id = UUID()
                    let message = Message(id: id, from: ._414C, text: text)
                    items.append(TerminalItem(id: id.uuidString, of: .message(text)))
                    TestViewModel.set(test: .none)
                    return (items, message)
                }
                
                var testWasSetup = false
                tests.forEach { test in
                    let symbol = test.symbol
                    if ascii.contains(symbol) {
                        items.append(TerminalItem(id: TerminalSymbol.id(from: test), of: .symbol(symbol)))
                        return
                    }
                    
                    let testItems = TerminalTest.getItems(from: test, radix: .bin)
                    if testWasSetup {
                        items.append(TerminalItem(id: test.id.uuidString, of: .test(test, testItems, false)))
                        return
                    }
                    testWasSetup.toggle()
                    items.append(TerminalItem(of: .help(test)))
                    items.append(TerminalItem(id: test.id.uuidString, of: .test(test, testItems, true)))
                    TestViewModel.set(test: test)
                }
            }
            if case let .art(arts) = type {
                items.append(TerminalItem(of: .art(arts)))
            }
        }
        return (items, .none)
    }

}

private func contains(all symbols: [ASCIISymbol], in basket: [ASCIISymbol]) -> Bool {
    for symbol in symbols {
        if !basket.contains(symbol) {
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
