//
//  SUB.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct SUB: EquationBuilder {
    var x: EquationBuilder
    var y: EquationBuilder
    
    init(_ x: EquationBuilder = ID(), _ y: EquationBuilder = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> Equation {
        var x: UInt8
        var y: UInt8
        if result == UInt8.max {
            y = 0
            x = UInt8.max
        } else {
            y = UInt8.random(in: 1...(UInt8.max - result))
            x = result + y
        }
        
        let xEq = self.x.eq(x)
        let yEq = self.y.eq(y)
        
        let xParts = xEq.parts.withParen(!(self.x is ID))
        let yParts = yEq.parts.withParen(!(self.y is ID))
        
        let hint = EquationHint(
            bin: xEq.hint.bin.withParenIfNeeded() + [.SIGN(.SUB)] + yEq.hint.bin.withParenIfNeeded(),
            hex: xEq.hint.hex.withParenIfNeeded() + [.SIGN(.SUB)] + yEq.hint.hex.withParenIfNeeded())
                
        return Equation(
            x: x,
            y: y,
            result: result,
            builder: self,
            parts: xParts + [.SIGN(.SUB)] + yParts,
            types: [.SUB] + xEq.types + yEq.types,
            test: { x - y == result },
            hint: hint
        )
    }
}

