//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//

import SwiftUI

struct TerminalHelp: View {
    
    let symbols: [ASCIISymbol]
    let theme: FigletTheme
    
    init(_ symbols: [ASCIISymbol], _ theme: FigletTheme = FigletTheme()) {
        print("TerminalHelp")
        self.symbols = symbols
        self.theme = theme
    }
    
    var body: some View {
        FigletView(symbols, theme: theme)
    }
}

/*
struct TerminalHelp_Previews: PreviewProvider {
    static var previews: some View {
        TerminalHelp()
    }
}
 */
