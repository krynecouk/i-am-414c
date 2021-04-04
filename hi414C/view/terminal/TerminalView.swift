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
    @EnvironmentObject var graphVM: GraphViewModel

    var body: some View {
            VStack(spacing: 0) {
                TerminalContent(getContent(from: contentVM.content, using: asciiVM.symbols), testVM: testVM)
                TerminalSegue(
                    header: TerminalCommandLine()) {
                    ASCIIKeyboardView() { input in
                        if (testVM.test != nil) {
                            let solution = testVM.solve(with: input)
                            switch solution {
                            case .right:
                                asciiVM.add(symbol: testVM.test!.symbol)
                            default:
                                print("not correct")
                            }
                        } else {
                            graphVM.process(ctx: GraphContext(input: input))
                        }
                    }
                }
            }
    }
}

private func getContent(from content: ASCIIContent, using ascii: [ASCIISymbol]) -> [TerminalContentType] {
    var result: [TerminalContentType] = []
    for contentItem in content {
        if case let .asciiTest(symbols) = contentItem {
            if containsAll(tested: symbols, from: ascii) {
                result.append(.message(symbols))
                continue
            }
            
            var testWasSetup = false
            symbols.forEach { symbol in
                if ascii.contains(symbol) {
                    result.append(.symbol(symbol))
                    return
                }
                let test = Tests[symbol][0]
                if testWasSetup {
                    result.append(.test(test, false))
                    return
                }
                testWasSetup.toggle()
                result.append(.test(test, true))
            }
        }
        if case let .asciiArt(arts) = contentItem {
            result.append(.art(arts))
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
