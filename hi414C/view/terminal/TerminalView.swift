//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var testVM: TestViewModel
    
    var body: some View {
        ZStack {
            TerminalContent(getContent(from: graphVM.node.id, using: asciiVM.symbols), testVM: testVM)
                .padding(30)
            TerminalCommandLine()
        }
    }
}

private func getContent(from string: String, using ascii: [ASCIISymbol]) -> [TerminalContentItem] {
    var testWasSetup = false
    return string.map { char in
        let symbol = ASCIISymbol.from(String(char))
        if ascii.contains(symbol) {
            return TerminalContentItem(type: .ascii(symbol))
        }
        let test = ASCIITests[symbol]![0]
        if testWasSetup {
            return TerminalContentItem(type: .test(test, false))
        }
        testWasSetup.toggle()
        return TerminalContentItem(type: .test(test, true))
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
            .withEnvironment()
    }
}
