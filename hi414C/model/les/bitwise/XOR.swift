//
//  XOR.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct XOR: EquationBuilder {
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
            if bit == "0" {
                let rnd = Int.random(in: 0...1)
                xByte += String(rnd)
                yByte += String(rnd)
            } else {
                let rnd = Int.random(in: 0...1)
                xByte += String(rnd)
                yByte += rnd == 0 ? "1" : "0"
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
            parts: xParts + [.SIGN(.XOR)] + yParts,
            types: [.XOR] + xEq.types + yEq.types,
            test: { x ^ y == result },
            hint: hint
        )
    }
}
