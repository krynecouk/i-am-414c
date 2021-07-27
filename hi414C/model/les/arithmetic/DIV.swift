//
//  DIV.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct DIV: EquationBuilder {
    var x: EquationBuilder
    var y: EquationBuilder
    
    init(_ x: EquationBuilder = ID(), _ y: EquationBuilder = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> Equation {
        if result == 0 {
            return ID() => result
        }
        
        let maxMultiplicator = 255 / result
        let y = UInt8.random(in: 1...maxMultiplicator)
        let x = result * y
        
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
        
        let hint = EquationHint(
            bin: xResult.hint.bin.withParen() + [.SIGN(.DIV)] + yResult.hint.bin.withParen(),
            hex: xResult.hint.hex.withParen() + [.SIGN(.DIV)] + yResult.hint.hex.withParen())
                
        return Equation(
            x: x,
            y: y,
            result: result,
            builder: self,
            parts: xParts + [.SIGN(.DIV)] + yParts,
            types: [.DIV] + xResult.types + yResult.types,
            test: { x / y == result },
            hint: hint
            )
    }
}
