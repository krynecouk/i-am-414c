//
//  ASCIIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

class ASCIIViewModel: ObservableObject {
    @Published private(set) var symbols: Set<ASCIISymbol> // TODO persistently store
        
    /*
     private var story: [ASCIISymbol] = defaultSymbols
     private var practice: [ASCIISymbol] = defaultSymbols
     */
    
    private static let defaultSymbols: Set<ASCIISymbol> = [
        .questionMark
    ]
    
    init() {
        self.symbols = ASCIIDao.find() ?? ASCIIViewModel.defaultSymbols
    }
    
    func add(symbol: ASCIISymbol) {
        print("adding \(symbol)")
        self.symbols.insert(symbol)
        ASCIIDao.store(symbols)
    }
    
    /*
     func change(to type: ASCIIViewModelType) {
     if type == .story {
     change(to: &story)
     } else {
     change(to: &practice)
     }
     }
     
     private func change(to array: inout [ASCIISymbol]) {
     self.symbols = array
     }
     */
    
    func reset() {
        self.symbols = ASCIIViewModel.defaultSymbols
        ASCIIDao.store([])
    }
}

enum ASCIIViewModelType {
    case story, practice
}
