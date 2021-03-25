//
//  FigletFont.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.03.2021.
//

typealias FigletFont = [ASCIISymbol:Figlet]

extension FigletFont {
    static func of(_ typeface: FigletTypeface = .ansi()) -> FigletFont {
        switch typeface {
        case .ansi(let variation):
            if variation == .shadow {
                return ANSIShadowFiglets.figlets
            }
            return ANSIRegularFiglets.figlets
        }
    }
}
