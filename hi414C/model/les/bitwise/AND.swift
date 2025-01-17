//
//  AND.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct AND: EquationBuilder {
    var x: EquationBuilder
    var y: EquationBuilder
    
    init(_ x: EquationBuilder = ID(), _ y: EquationBuilder = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> Equation {
        var xByte: String = ""
        var yByte: String = ""
        
        result.toBinStr().forEach { bit in
            if bit == "1" {
                xByte += "1"
                yByte += "1"
            } else {
                let rnd = Int.random(in: 0...1)
                xByte += String(rnd)
                yByte += rnd == 1 ? "0" : "1"
            }
        }
        
        let xEq = self.x.eq(UInt8.from(bin: xByte))
        let yEq = self.y.eq(UInt8.from(bin: yByte))
        
        let xParts = xEq.parts.withParen(!(self.x is ID))
        let yParts = yEq.parts.withParen(!(self.y is ID))
                
        let x: UInt8 = UInt8.from(bin: xByte)
        let y: UInt8 = UInt8.from(bin: yByte)
        
        let hint = bitwiseHint(for: result)
                
        return Equation(
            x: x,
            y: y,
            result: result,
            builder: self,
            parts: xParts + [.SIGN(.AND)] + yParts,
            types: [.AND] + xEq.types + yEq.types,
            test: { x & y == result },
            hint: hint
        )
    }
}

