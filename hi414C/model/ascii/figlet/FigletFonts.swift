//
//  FigletFonts.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

struct FigletFonts {
    private init() {}
    static subscript(typeface: FigletTypeface) -> [ASCIISymbol: Figlet] {
        switch typeface {
        case .ansi(let variation):
            if variation == .shadow {
                return ANSIShadow.figlets
            }
            return ANSIRegular.figlets
        }
    }
}
