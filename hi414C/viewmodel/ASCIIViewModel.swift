//
//  ASCIIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

class ASCIIViewModel: ObservableObject {
    @Published private(set) var symbols: [ASCIISymbol] = [
        .one,
        .two,
        .three,
        .four,
        .five,
        .six,
        .seven,
        .eight,
        .nine,
        .zero,
        .questionMark
    ] // TODO persistently store
    
    func add(symbol: ASCIISymbol) {
        self.symbols.append(symbol)
    }
}
