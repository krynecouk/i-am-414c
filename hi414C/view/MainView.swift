//
//  MainView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var graphViewModel: GraphViewModel
    @EnvironmentObject var asciiViewModel: ASCIIViewModel
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 60, maximum: .infinity)),
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                // todo symbols duplicate
                ForEach(symbols(from: graphViewModel.node.id), id: \.self) { symbol in
                    if asciiViewModel.known.contains(symbol) {
                        FigletBanner(symbol.rawValue)
                    } else {
                        let test = ASCIITests[symbol]![0]
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
            .padding(30)
        }
    }
    
    func symbols(from string: String) -> [ASCIISymbol] {
        string.map { char in
            ASCII.from(symbol: String(char))!.symbol
        }
    }
}

struct Element: Identifiable {
    var id = UUID()
    var type: ElementType
}

enum ElementType {
    case ascii(ASCIISymbol)
    case test(Testable)
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .withEnvironment()
    }
}
