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
    @EnvironmentObject var graphVM: GraphViewModel
    
    init() {
        print("TerminalView")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TerminalGrid(items: getItems(from: terminalVM.content, ascii: asciiVM.symbols))
            TerminalFooter()
        }
    }
    
    private func getPaths(from node: Node, ascii: [ASCIISymbol]) -> Set<String> {
        var paths: Set<String> = []
        for edge in node.edges {
            paths.insert(edge.id)
            if let asciiEdge = edge as? ASCIITestEdge {
                paths.formUnion(Set(asciiEdge.variants))
            }
        }
        return paths.filter { contains(all: $0.map { ASCIISymbol.from($0) }, in: ascii ) }
    }
    
    private func getItems(from types: [TerminalContentType], ascii: [ASCIISymbol]) -> [TerminalItem] {
        print("Calculating Test Content Items")

        var items: [TerminalItem] = []
        for type in types {
            if case let .test(tests) = type {
                let symbols = tests.map { $0.symbol }
                if contains(all: symbols, in: ascii) {
                    let text = symbols.map { $0.rawValue }.joined()
                    items.append(TerminalItem(of: .message(text, getPaths(from: graphVM.node, ascii: ascii))))
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
                    
                    let testItems = TerminalTest.getItems(from: test)
                    if testWasSetup {
                        items.append(TerminalItem(id: test.id.uuidString, of: .test(test, testItems, false)))
                        return
                    }
                    testWasSetup.toggle()
                    items.append(TerminalItem(of: .help(test)))
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
