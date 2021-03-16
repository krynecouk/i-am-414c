//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var graphViewModel = GraphViewModel()
    @StateObject var asciiViewModel = ASCIIViewModel()
    @StateObject var testViewModel = TestViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 60, maximum: .infinity)),
    ]
    
    var body: some View {
        ZStack {
            CathodeView {
                VStack {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            // todo symbols duplicate
                            ForEach(symbols(from: graphViewModel.node.id), id: \.self) { symbol in
                                if asciiViewModel.known.contains(symbol) {
                                    FigletBanner(symbol.rawValue)
                                } else {
                                    let test = ASCIITests[symbol]![0]
                                    FigletBanner(test.test)
                                }
                            }
                        }
                        .padding(30)
                    }
                }
                TerminalView()
                    .environmentObject(graphViewModel)
                    .environmentObject(asciiViewModel)
                    .environmentObject(testViewModel)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    func symbols(from string: String) -> [ASCIISymbol] {
        string.map { char in
            ASCII.from(symbol: String(char))!.symbol
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
