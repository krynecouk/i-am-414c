//
//  Figlet.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

struct Figlet: ASCIIPrintable, Hashable {
    var symbol: ASCIISymbol
    var lines: [String]
}

extension Figlet {
    static func of(_ symbol: ASCIISymbol, typeface: FigletTypeface = .ansi()) -> Figlet {
        guard let figlet = FigletFont.of(typeface)[symbol] else {
            print("unable to find figlet symbol \(symbol) of typeface \(typeface)")
            return FigletFont.of(typeface)[.Z]!
        }
        return figlet
    }
}
