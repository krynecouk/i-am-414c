//
//  SUB.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct SUB: Equation {
    var x: Equation
    var y: Equation
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        let y: UInt8 = UInt8.random(in: 0...result)
        let x: UInt8 = result + y
        
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
                
        return EquationResult(x: x, y: y, result: result, parts: xParts + [.OP(.SUB)] + yParts, test: { x - y == result })
    }
}

