//
//  ASCIIGrid.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct ASCIIGrid: View {
    var content: String
    var knownSymbols: [ASCIISymbol]
    
    var body: some View {
        Grid {
            ForEach(ascii(from: content)) { ascii in
                if knownSymbols.contains(ascii.symbol) {
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

struct ASCIIGrid_Previews: PreviewProvider {
    static var previews: some View {
        ASCIIGrid(content: "HI", knownSymbols: [.H])
    }
}
