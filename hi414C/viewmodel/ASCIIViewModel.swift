//
//  ASCIIViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 16.03.2021.
//

import SwiftUI

class ASCIIViewModel: ObservableObject {
    @Published private(set) var symbols: Set<ASCIISymbol> // TODO persistently store
    
    private let key = "ASCIISymbols"
    
    /*
     private var story: [ASCIISymbol] = defaultSymbols
     private var practice: [ASCIISymbol] = defaultSymbols
     */
    
    private static let defaultSymbols: Set<ASCIISymbol> = [
        .questionMark
    ]
    
    init() {
        if let stored = UserDefaults.standard.data(forKey: key) {
            print("FOUND stored: ", stored)
            if let decoded = try? JSONDecoder().decode(Set<ASCIISymbol>.self, from: stored) {
                self.symbols = decoded
                return
            }
        }
        print("Stored not found")
        self.symbols = ASCIIViewModel.defaultSymbols
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(symbols) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func add(symbol: ASCIISymbol) {
        print("adding \(symbol)")
        self.symbols.insert(symbol)
        save()
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
        save()
    }
}

enum ASCIIViewModelType {
    case story, practice
}
