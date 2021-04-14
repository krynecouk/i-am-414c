//
//  DIV.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct DIV: Equation {
    var x: Equation
    var y: Equation
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        let maxMultiplicator = 255 / result
        let y = UInt8.random(in: 1...maxMultiplicator)
        let x = result * y
        
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
                
        return EquationResult(x: x, y: y, result: result, parts: xParts + [.OP(.DIV)] + yParts, test: { x / y == result })
    }
}
