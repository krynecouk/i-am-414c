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
    var shadow: Bool
    
    init(_ content: String, theme: FigletTheme = FigletTheme(), shadow: Bool = false) {
        self.init(content.map { ASCIISymbol.from(String($0)) }, theme: theme, shadow: shadow)
    }
    
    init(_ content: ASCIISymbol, theme: FigletTheme = FigletTheme(), shadow: Bool = false) {
        self.init([content], theme: theme, shadow: shadow)
    }
    
    init(_ content: [ASCIISymbol], theme: FigletTheme = FigletTheme(), shadow: Bool = false) {
        self.figlets = content.map { symbol in
            return Figlet.of(symbol, typeface: theme.typeface)
        }
        self.theme = theme
        self.shadow = shadow
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { i in
                let figletText = figlets[i].lines.joined(separator: "\n")
                ZStack {
                    if self.shadow {
                        Text(figletText)
                            .opacity(0.3)
                            .offset(x: 5, y: 5)
                            .withTheme(theme.view)
                    }
                    Text(figletText)
                        .withTheme(theme.view)
                }
                
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
