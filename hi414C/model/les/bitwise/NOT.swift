//
//  NOT.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct NOT: Equation {
    var x: Equation
    
    init(_ x: Equation = ID()) {
        self.x = x
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        var xByte: String = ""
        
        result.toBinStr().forEach { bit in
            if bit == "1" {
                xByte += "0"
            } else {
                xByte += "1"
            }
        }
        
        let xResult = self.x.eq(UInt8.from(bin: xByte))
        let xParts = xResult.parts.withParen(!(self.x is ID))
        
        let x: UInt8 = UInt8.from(bin: xByte)
                
        return EquationResult(x: x, result: result, parts: [.OP(.NOT)] + xParts, test: { ~x == result })
    }
}
