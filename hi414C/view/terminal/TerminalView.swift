//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var contentVM: ContentViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel

    var body: some View {
        ZStack {
            TerminalContent(getContent(from: contentVM.content, using: asciiVM.symbols), testVM: testVM)
                .padding(30)
            TerminalCommandLine()
        }
    }
}

private func getContent(from content: ContentType, using ascii: [ASCIISymbol]) -> [TerminalContentType] {
    if case let .asciiTest(symbols) = content {
        if containsAll(tested: symbols, from: ascii) {
            return [.message(symbols)]
        }
        
        var testWasSetup = false
        return symbols.map { symbol in
            if ascii.contains(symbol) {
                return .symbol(symbol)
            }
            let test = Tests[symbol][0]
            if testWasSetup {
                return .test(test, false)
            }
            testWasSetup.toggle()
            return .test(test, true)
        }
    }
    return []
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
