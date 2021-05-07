//
//  ASCIIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

class ASCIIViewModel: ObservableObject {
    @Published private(set) var symbols: [ASCIISymbol] = defaultSymbols // TODO persistently store
    
    private static let defaultSymbols: [ASCIISymbol] = [
        .questionMark
    ]
    
    func add(symbol: ASCIISymbol) {
        print("adding \(symbol)")
        self.symbols.append(symbol)
    }
    
    func reset() {
        self.symbols = ASCIIViewModel.defaultSymbols
    }
}
