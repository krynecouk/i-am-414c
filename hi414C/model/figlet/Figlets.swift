//
//  Figlets.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.03.2021.
//

protocol Figlets {
    static var figlets: [ASCIISymbol:Figlet] { get }
    static subscript(symbol: ASCIISymbol) -> Figlet? { get }
}
