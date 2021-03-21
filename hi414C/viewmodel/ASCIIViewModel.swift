//
//  ASCIIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

class ASCIIViewModel: ObservableObject {
    @Published private(set) var symbols: [ASCIISymbol] = [] // TODO persistently store
    @Published private(set) var current: [ASCIISymbol] = []
    
    func add(symbol: ASCIISymbol) {
        self.symbols.append(symbol)
    }
    
    func setCurrent(current: [ASCIISymbol]) {
        self.current = current
    }
}
