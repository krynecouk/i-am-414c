//
//  Test.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

import Foundation

struct Test: Identifiable, Equatable {
    var id = UUID()
    var symbol: ASCIISymbol
    var equation: Equation
    
    static func == (lhs: Test, rhs: Test) -> Bool {
        lhs.id == rhs.id
    }
}
