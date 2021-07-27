//
//  MUL.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

import Foundation

struct MUL: EquationBuilder {
    var x: EquationBuilder
    var y: EquationBuilder
    
    init(_ x: EquationBuilder = ID(), _ y: EquationBuilder = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> Equation {
        var x: UInt8
        var y: UInt8
        
        if result == 0 {
            y = 0
            x = UInt8.random(in: 0...UInt8.max)
        } else {
            var denominators = result.getAllDenominators()
            // prefer less of: * 00000001
            if denominators.count > 2 {
                denominators = denominators.filter { $0 != 1 && $0 != result }
            }
            
            y = result / denominators.randomElement()!
            x = result / y
        }
        
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
        
        let hint = EquationHint(
            bin: xResult.hint.bin.withParen() + [.SIGN(.MUL)] + yResult.hint.bin.withParen(),
            hex: xResult.hint.hex.withParen() + [.SIGN(.MUL)] + yResult.hint.hex.withParen())
        
        return Equation(
            x: x,
            y: y,
            result: result,
            builder: self,
            parts: xParts + [.SIGN(.MUL)] + yParts,
            types: [.MUL] + xResult.types + yResult.types,
            test: { x * y == result },
            hint: hint
        )
    }
}
