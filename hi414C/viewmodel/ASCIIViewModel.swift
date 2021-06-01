//
//  ASCIIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

class ASCIIViewModel: ObservableObject {
    @Published private(set) var symbols: Set<ASCIISymbol>
    
    private static let defaultSymbols: Set<ASCIISymbol> = [
        .questionMark,
        .F,
        .X
    ]
        
    private static let testSymbols: Set<ASCIISymbol> = [ .questionMark, .Q, .W, .E, .R, .T, .Y, .U, .I, .O, .P, .A, .S, .D, .F, .G, .H, .J, .K, .L, .Z, .X, .C, .V, .B, .N, .M, .space, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .dash, .plus, .equal, .slash, .colon, .semicolon,
        .leftParen, .rightParen, .dollar, .ampersand,.atSign, .backslash, .doubleQuote, .dot, .comma,.questionMark, .exclamationMark, .singleQuote,.leftSquare, .rightSquare, .lessThan,.greaterThan, .caret, .asterisk, .pipe, .tilde
    ]
    
    init() {
        self.symbols = ASCIIDao.find() ?? ASCIIViewModel.defaultSymbols
    }
    
    func add(symbol: ASCIISymbol) {
        print("adding \(symbol)")
        self.symbols.insert(symbol)
        ASCIIDao.store(symbols)
    }
    
    func reset() {
        self.symbols = ASCIIViewModel.defaultSymbols
        ASCIIDao.store(self.symbols)
    }
}
