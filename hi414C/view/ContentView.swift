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
    
    var body: some View {
        ZStack {
            CathodeView {
                MainView {
                    ForEach(ascii(from: graphViewModel.node.id)) { ascii in
                        if asciiViewModel.known.contains(ascii.symbol) {
                            FigletBanner(ascii.symbol.rawValue)
                        } else {
                            let test = ASCIITests[ascii.symbol]![0]
                            FigletBanner(test.test)
                                .onAppear {
                                    Tests.setCurrent(test: test)
                                }
                                .onTapGesture {
                                    Tests.setCurrent(test: test)
                                }
                        }
                    }
                }
                TerminalView()
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

func ascii(from string: String) -> [ASCIIItem] {
    string.map { char in
        let symbol = ASCII.from(symbol: String(char))!.symbol
        return ASCIIItem(symbol: symbol)
    }
}

struct ASCIIItem: Identifiable {
    var id = UUID()
    var symbol: ASCIISymbol
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .withEnvironment()
    }
}
