//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var graphViewModel: GraphViewModel
    @EnvironmentObject var asciiViewModel: ASCIIViewModel
    // tady asi nejaky Binding na test, ktery poslat i dolu
    
    var body: some View {
        ZStack {
            CathodeView {
                ASCIITestGrid(toElements(from: graphViewModel.node.id))
                    .padding(30)
                
              //  ASCIITestGrid(content: graphViewModel.node.id, knownSymbols: asciiViewModel.known)
              //      .padding(30)
                TerminalView()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    func toElements(from string: String) -> [Element] {
        var testWasSetup = false
        return string.map { char in
            let symbol = ASCII.from(symbol: String(char))!.symbol
            if asciiViewModel.known.contains(symbol) {
                return .ascii(symbol)
            }
            let test = ASCIITests[symbol]![0]
            if testWasSetup {
                return .test(test, false)
            }
            testWasSetup.toggle()
            return .test(test, true)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .withEnvironment()
    }
}
