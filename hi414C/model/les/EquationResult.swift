//
//  EquationResult.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct EquationResult {
    var x: UInt8 = 0
    var y: UInt8 = 0
    var result: UInt8
    var parts: EquationParts
    var test: () -> Bool
}
