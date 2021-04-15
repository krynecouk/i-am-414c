//
//  MUL.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

import Foundation

struct MUL: Equation {
    var x: Equation
    var y: Equation
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        var x: UInt8
        var y: UInt8
        
        if result == 0 {
            y = 0
            x = UInt8.random(in: 0...UInt8.max)
        } else {
            var denominators = result.getAllDenominators()
            // prefer (2..<UInt8.max) result
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
                
        return EquationResult(x: x, y: y, result: result, parts: xParts + [.OP(.MUL)] + yParts, test: { x * y == result })
    }
}
