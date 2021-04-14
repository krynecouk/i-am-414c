//
//  SHL.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

import Foundation

struct SHL: Equation {
    var x: Equation
    var y: Equation
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        if result == 0 {
            return ID() => 0
        }
        
        let modulo = result % 2
        let toSHL = result - modulo
        
        if modulo != 0 {
            return ADD(SHL(), (ID(), modulo)) => result
        }
        
        let denominators = toSHL.getAllDenominators().filter { [2, 4, 8, 16, 32, 64, 128].contains(toSHL/$0) }
        let x: UInt8 = denominators.randomElement()!
        let y: UInt8 = UInt8(log2(Double(toSHL/x)))
                
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
        
        return EquationResult(x: x, y: y, result: result, parts: xParts + [.OP(.SHL)] + yParts, test: { x << y == toSHL })
    }
}
