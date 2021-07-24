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
    @EnvironmentObject var chatVM: ChatViewModel
    
    init() {
        print("TerminalView")
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            let items = getContent(from: terminalVM.content, ascii: asciiVM.symbols)
            TerminalContent(items: items)
            TerminalFooter()
        }
        .helpEdgeDrag()
        .statusBar(hidden: true)
    }
    
    private func getContent(from types: [TerminalContentType], ascii: Set<ASCIISymbol>) -> [TerminalItem] {
        var items: [TerminalItem] = []
        for type in types {
            if case let .test(tests) = type {
                let symbols = tests.map { $0.symbol }
                if ascii.contains(all: symbols) { // message node
                    let text = symbols.map { $0.rawValue }.joined()
                    let id = UUID()
                    let message = Message(id: id, from: .robot, text: text)
                    let (current, root) = graphVM.getReplies(ascii: ascii)
                    chatVM.setCurrent(message: message, replies: current)
                    chatVM.setRoot(message: message, replies: root)
                    chatVM.setAllReplies(Array(chatVM.current.replies) + Array(chatVM.root.replies))
                    items.append(TerminalItem(id: id.uuidString, of: .message(text)))
                    testVM.set(test: .none)
                    return items
                }
                
                chatVM.setCurrent(message: .none, replies: [])
                chatVM.setRoot(message: .none, replies: [])
                chatVM.setAllReplies([])
                var testWasSetup = false
                tests.forEach { test in // test node
                    let symbol = test.symbol
                    if ascii.contains(symbol) {
                        items.append(TerminalItem(id: TerminalSymbol.id(from: test), of: .symbol(symbol)))
                        return
                    }
                    
                    let unsolved = TerminalTest.getItems(from: test, radix: testVM.radix)
                    let solved = TerminalTest.getItems(id: test.id, equation: test.equation.toString(radix: testVM.radix, result: (true, .dec)))
                    if testWasSetup {
                        items.append(TerminalItem(id: test.id.uuidString, of: .test(test, (unsolved, solved), false)))
                        return
                    }
                    testWasSetup.toggle()
                    items.append(TerminalItem(id: test.id.uuidString, of: .test(test, (unsolved, solved), true)))
                    testVM.set(test: test)
                }
            }
        }
        return items
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
            .withEnvironment()
    }
}
