//
//  LiteFigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 31.03.2021.
//

import SwiftUI

struct LiteFigletView: View {
    let figlets: [Figlet]
    var theme: FigletTheme
    
    init(_ content: String, theme: FigletTheme = FigletTheme()) {
        self.init(content.map { ASCIISymbol.from(String($0)) }, theme: theme)
    }
    
    init(_ content: ASCIISymbol, theme: FigletTheme = FigletTheme()) {
        self.init([content], theme: theme)
    }
    
    init(_ content: [ASCIISymbol], theme: FigletTheme = FigletTheme()) {
        self.figlets = content.map { symbol in
            return Figlet.of(symbol, typeface: theme.typeface)
        }
        self.theme = theme
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { i in
                Text(figlets[i].lines.joined(separator: "\n"))
                    .withTheme(theme.view)
            }
        }
        
    }
}

struct LiteFigletView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LiteFigletView("HELLO")
        }
    }
}
