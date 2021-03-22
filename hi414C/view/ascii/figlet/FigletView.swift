//
//  FigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

struct FigletView: View {
    let figlets: [Figlet]
    
    init(_ content: String) {
        self.figlets = content.map { char in
            let symbol = ASCIISymbol.from(String(char))
            return FigletFonts[.ansi()][symbol]!
        }
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { ASCIIArtView(lines: figlets[$0].lines) }
        }
    }
}

struct FigletView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FigletView("HELLO")
        }
    }
}
