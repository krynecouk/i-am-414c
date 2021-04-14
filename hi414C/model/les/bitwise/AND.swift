//
//  AND.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct AND: Equation {
    var x: Equation
    var y: Equation
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        var xByte: String = ""
        var yByte: String = ""
        
        result.toByteStr().forEach { bit in
            if bit == "1" {
                xByte += "1"
                yByte += "1"
            } else {
                let rnd = Int.random(in: 0...1)
                xByte += String(rnd)
                yByte += rnd == 1 ? "0" : "1"
            }
        }
        
        let xResult = self.x.eq(UInt8.from(bin: xByte))
        let yResult = self.y.eq(UInt8.from(bin: yByte))
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
                
        return EquationResult(x: UInt8.from(bin: xByte), y: UInt8.from(bin: yByte), result: result, parts: xParts + [.OP(.AND)] + yParts)
    }
}
