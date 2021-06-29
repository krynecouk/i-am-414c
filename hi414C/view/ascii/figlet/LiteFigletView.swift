//
//  LiteFigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 31.03.2021.
//

import SwiftUI

struct LiteFigletView: View {
    let figlets: [Figlet]
    var theme: LiteFigletTheme
    
    init(_ content: String, theme: LiteFigletTheme = LiteFigletTheme()) {
        self.init(content.map { ASCIISymbol.from(String($0)) }, theme: theme)
    }
    
    init(_ content: ASCIISymbol, theme: LiteFigletTheme = LiteFigletTheme()) {
        self.init([content], theme: theme)
    }
    
    init(_ content: [ASCIISymbol], theme: LiteFigletTheme = LiteFigletTheme()) {
        self.figlets = content.map { symbol in
            return Figlet.of(symbol, typeface: theme.typeface)
        }
        self.theme = theme
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { i in
                let figletText = figlets[i].lines.joined(separator: "\n")
                if theme.shadow {
                    ZStack {
                        Text(figletText)
                            .opacity(0.3)
                            .offset(x: 5, y: 5)
                            .withTheme(theme.view)
                        
                        Text(figletText)
                            .withTheme(theme.view)
                    }
                } else {
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
