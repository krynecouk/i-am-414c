//
//  FigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

struct FigletView: View {
    let figlets: [Figlet]
    var settings: ASCIIArtSettings
    
    init(_ content: String, settings: ASCIIArtSettings = ASCIIArtSettings()) {
        self.figlets = content.map { char in
            let symbol = ASCIISymbol.from(String(char))
            return FigletFonts[.ansi()][symbol]!
        }
        self.settings = settings
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { i in
                ASCIIArtView(lines: figlets[i].lines, settings: settings)
            }
        }
    }
}

struct FigletView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FigletView("H")
        }
    }
}
