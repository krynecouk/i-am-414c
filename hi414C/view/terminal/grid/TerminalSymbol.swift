//
//  TerminalSymbol.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.05.2021.
//

import SwiftUI

struct TerminalSymbol: View {
    let symbol: ASCIISymbol
    let theme: FigletTheme
    
    init(_ symbol: ASCIISymbol, theme: FigletTheme) {
        self.symbol = symbol
        self.theme = theme
    }
    
    var body: some View {
        FigletView(symbol.rawValue, theme: theme)
    }
    
    public static func id(from test: Test) -> String {
        "\(test.id.uuidString)\(test.symbol.rawValue)"
    }
}
