//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @EnvironmentObject var graphViewModel: GraphViewModel
    @EnvironmentObject var asciiViewModel: ASCIIViewModel
    
    var body: some View {
        TerminalContent(getContent(from: graphViewModel.node.id))
            .padding(30)
        TerminalCommandLine()
    }
    
    func getContent(from string: String) -> [TerminalContentItem] {
        var testWasSetup = false
        return string.map { char in
            let symbol = ASCII.from(symbol: String(char))!.symbol
            if asciiViewModel.known.contains(symbol) {
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
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
            .withEnvironment()
    }
}
