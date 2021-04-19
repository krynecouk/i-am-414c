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

    var body: some View {
            VStack(spacing: 0) {
                TerminalContentOld(getContent(from: terminalVM.content, using: asciiVM.symbols))
                TerminalSegue()
            }
    }
}

private func getContent(from content: TerminalContent, using ascii: [ASCIISymbol]) -> [TerminalContentItemOld] {
    var result: [TerminalContentItemOld] = []
    for contentItem in content {
        if case let .asciiTest(tests) = contentItem {
            let symbols = tests.map { $0.symbol }
            if containsAll(tested: symbols, from: ascii) {
                result.append(TerminalContentItemOld(.message(symbols)))
                continue
            }
            
            var testWasSetup = false
            tests.forEach { test in
                let symbol = test.symbol
                if ascii.contains(symbol) {
                    result.append(TerminalContentItemOld(.symbol(symbol), id: "\(test.id.uuidString)\(symbol.rawValue)"))
                    return
                }

                if testWasSetup {
                    result.append(TerminalContentItemOld(.test(test, false), id: "\(test.id.uuidString)"))
                    return
                }
                testWasSetup.toggle()
                result.append(TerminalContentItemOld(.test(test, true), id: "\(test.id.uuidString)"))
            }
        }
        if case let .asciiArt(arts) = contentItem {
            result.append(TerminalContentItemOld(.art(arts)))
        }
    }
    return result
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
