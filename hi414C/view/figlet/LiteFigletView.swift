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
    var shadowOffset: Offset
    
    init(_ content: String, theme: FigletTheme = FigletTheme(), shadow: Bool = false, shadowOffset: Offset = (5, 5)) {
        self.init(content.map { ASCIISymbol.from(String($0)) }, theme: theme, shadow: shadow, shadowOffset: shadowOffset)
    }
    
    init(_ content: ASCIISymbol, theme: FigletTheme = FigletTheme(), shadow: Bool = false, shadowOffset: Offset = (5, 5)) {
        self.init([content], theme: theme, shadow: shadow, shadowOffset: shadowOffset)
    }
    
    init(_ content: [ASCIISymbol], theme: FigletTheme = FigletTheme(), shadow: Bool = false, shadowOffset: Offset = (5, 5)) {
        self.figlets = content.map { symbol in
            return Figlet.of(symbol, typeface: theme.typeface)
        }
        self.theme = theme
        self.shadow = shadow
        self.shadowOffset = shadowOffset
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { i in
                let figletText = figlets[i].lines.joined(separator: "\n")
                ZStack {
                    if self.shadow {
                        Text(figletText)
                            .opacity(0.3)
                            .offset(x: self.shadowOffset.x, y: self.shadowOffset.y)
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
