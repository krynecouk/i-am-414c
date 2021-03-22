//
//  Figlet.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 10.03.2021.
//

struct Figlet: ASCIIArt, Hashable {
    var symbol: ASCIISymbol
    var lines: [String]
}
