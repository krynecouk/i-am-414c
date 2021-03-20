//
//  FigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

struct FigletView: View {
    let content: String
    let typeface: FigletTypeface = .ansi()
    var animations: [FigletAnimation] = []
    var offset: CGFloat = 0
    var isVisible: Bool = false
    var color: Color = Color("Primary")
    var fontName: FontName = .terminus
    var fontSize: CGFloat = 13
    
    var body: some View {
        Group {
            ForEach(toFiglets(from: content).indices) { i in
                let figlet = toFiglets(from: content)[i] // TODO!!!
                FigletLines(lines: figlet.lines, animations: [.print, .shake])
            }
        }
    }
    
    func toFiglets(from string: String) -> [Figlet] {
        string.map { FigletFonts[typeface][ASCIISymbol.from(String($0))]! }
    }
}

struct FigletView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FigletView(content: "HELLO")
        }
    }
}


