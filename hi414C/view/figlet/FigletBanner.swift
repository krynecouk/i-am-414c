//
//  FigletBanner.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

struct FigletBanner: View {
    let figlets: [FigletItem]
    let typeface: FigletTypeface
    
    init(_ content: String, typeface: FigletTypeface = .ansi(.regular)) {
        self.figlets = content.map { char in
            let symbol = ASCIISymbol.from(String(char))
            return FigletItem(figlet: FigletFonts[typeface][symbol]!)
        }
        self.typeface = typeface
    }
    
    var body: some View {
        Group {
            ForEach(figlets) { item in
                FigletView2(item.figlet)
            }
        }
    }
}

struct FigletBanner_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            FigletBanner("HELLO")
        }
    }
}

struct FigletItem : Identifiable {
    let id = UUID()
    let figlet: Figlet
}
