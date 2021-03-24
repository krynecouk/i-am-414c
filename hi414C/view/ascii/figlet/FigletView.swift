//
//  FigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

struct FigletView: View {
    let figlets: [Figlet]
    var settings: FigletSettings
    
    init(_ content: String, settings: FigletSettings = FigletSettings()) {
        self.figlets = content.map { char in
            let symbol = ASCIISymbol.from(String(char))
            return FigletFonts[settings.typeface][symbol]!
        }
        self.settings = settings
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { i in
                ASCIIArtView(lines: figlets[i].lines, settings: ASCIIArtSettings(
                    view: settings.view, animations: settings.animations
                ))
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
