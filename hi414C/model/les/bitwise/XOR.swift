//
//  XOR.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct XOR: Equation {
    var x: Equation
    var y: Equation

    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
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
        
        let xResult = self.x.eq(UInt8.from(bin: xByte))
        let yResult = self.y.eq(UInt8.from(bin: yByte))
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
        
        let x: UInt8 = UInt8.from(bin: xByte)
        let y: UInt8 = UInt8.from(bin: yByte)
        
        return EquationResult(x: x, y: y, result: result, parts: xParts + [.OP(.XOR)] + yParts, test: { x ^ y == result })
    }
}
