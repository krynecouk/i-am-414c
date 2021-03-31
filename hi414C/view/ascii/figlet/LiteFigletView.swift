//
//  LiteFigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 31.03.2021.
//

import SwiftUI

struct LiteFigletView: View {
    let figlets: [Figlet]
    var settings: FigletSettings
    
    init(_ content: String, settings: FigletSettings = FigletSettings()) {
        self.init(content.map { ASCIISymbol.from(String($0)) }, settings: settings)
    }
    
    init(_ content: ASCIISymbol, settings: FigletSettings = FigletSettings()) {
        self.init([content], settings: settings)
    }
    
    init(_ content: [ASCIISymbol], settings: FigletSettings = FigletSettings()) {
        self.figlets = content.map { symbol in
            return Figlet.of(symbol, typeface: settings.typeface)
        }
        self.settings = settings
    }
    
    var body: some View {
        Group {
            ForEach(figlets.indices) { i in
                Text(figlets[i].lines.joined(separator: "\n"))
                    .withSettings(settings.view)
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
