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
    @EnvironmentObject var historyVM: HistoryViewModel
    
    init() {
        print("TerminalView")
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            let (items, messages) = getContent(from: terminalVM.content, ascii: asciiVM.symbols)
            TerminalContent(items: items, messages: messages)
            TerminalFooter()
        }
        .helpEdgeDrag()
        .statusBar(hidden: true)
    }
    
    private func getContent(from types: [TerminalContentType], ascii: Set<ASCIISymbol>) -> ([TerminalItem], Messages?) {
        print("Calculating Test Content Items")

        var items: [TerminalItem] = []
        for type in types {
            if case let .test(tests) = type {
                let symbols = tests.map { $0.symbol }
                if ascii.contains(all: symbols) {
                    let text = symbols.map { $0.rawValue }.joined()
                    historyVM.replace(with: graphVM.getAnswers(ascii: ascii))
                    let id = UUID()
                    let message = Message(id: id, from: .robot, text: text)
                    let messages = Messages(history: historyVM.history, current: message)
                    items.append(TerminalItem(id: id.uuidString, of: .message(text)))
                    testVM.set(test: .none)
                    return (items, messages)
                }
                
                var testWasSetup = false
                tests.forEach { test in
                    let symbol = test.symbol
                    if ascii.contains(symbol) {
                        items.append(TerminalItem(id: TerminalSymbol.id(from: test), of: .symbol(symbol)))
                        return
                    }
                    
                    let testItems = TerminalTest.getItems(from: test, radix: testVM.radix)
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
        return (items, .none)
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
            .withEnvironment()
    }
}
