//
//  IdFigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.05.2021.
//

import SwiftUI

struct IdFigletView: View {
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
            ForEach(figlets.map { FigletItem(figlet: $0) }) { item in
                ASCIIArtView(item.figlet, theme: ArtTheme(
                    view: theme.view, animations: theme.animations
                ))
            }
        }
        .compositingGroup()
    }
}

private struct FigletItem: Identifiable {
    var id = UUID()
    var figlet: Figlet
}

