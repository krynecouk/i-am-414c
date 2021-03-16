//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var graphViewModel = GraphViewModel()
    @StateObject var testViewModel = TestViewModel()
    @StateObject var asciiViewModel = ASCIIViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 60, maximum: .infinity)),
    ]
    
    var body: some View {
        ZStack {
            CathodeView {
                VStack {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            ForEach(symbols(from: graphViewModel.node.id), id: \.self) { symbol in
                                if asciiViewModel.known.contains(symbol) {
                                    FigletBanner(symbol.rawValue)
                                } else {
                                    Foo(symbol)
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

struct Foo: View {
    @ObservedObject var testViewModel = TestViewModel()
    let symbol: ASCIISymbol
    let test: ASCIITest
    
    init(_ symbol: ASCIISymbol) {
        self.symbol = symbol
        self.test = ASCIITests[symbol]![0]
        testViewModel.setCurrent(test: test)
    }
    
    var body: some View {
        FigletBanner(test.test)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
