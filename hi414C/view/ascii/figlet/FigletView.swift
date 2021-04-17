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
                ASCIIArtView(figlets[i], theme: ASCIIArtTheme(
                    view: theme.view, animations: theme.animations
                ))
            }
        }
    }
}

private struct FigletItem: Identifiable {
    var id = UUID()
    var figlet: Figlet
}

struct FigletView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FigletView([.H], theme: FigletTheme(
                animations: [.print(), .bloom(speed: 0.5)]
            ))
            .onTapGesture {
                print("tapped")
            }
        }
    }
}
