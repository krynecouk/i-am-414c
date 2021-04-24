//
//  Equation.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct Equation {
    var x: UInt8 = 0
    var y: UInt8 = 0
    var result: UInt8
    var parts: EquationParts
    var types: Set<EquationType>
    var test: () -> Bool
}

extension Equation {
    func toString(radix: EquationRadix = .bin, result: (visible: Bool, radix: EquationRadix) = (false, .bin)) -> String {
        result.visible
            ? (self.parts + [.SYM(.EQ), .RESULT(self.result)]).toString(radix: (radix, result.radix))
            : self.parts.toString(radix: (radix, result.radix))
    }
}
