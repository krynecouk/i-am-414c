//
//  FigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

struct FigletView: View {
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
            ForEach(figlets.map { Item($0) }) { item in
                FigletPrinter(item.content, theme: self.theme, shadow: self.shadow)
            }
        }
    }
}

struct FigletView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FigletView([.H], theme: FigletTheme(
                animations: [.print(), .bloom(speed: 0.5)]
            ))
        }
    }
}
