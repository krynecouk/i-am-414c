//
//  ASCIIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

class ASCIIViewModel: ObservableObject {
    @Published private(set) var known: [ASCIISymbol] = [] // TODO this needs to be persistentnly stored
    
    func add(symbol: ASCIISymbol) {
        self.known.append(symbol)
    }
}
