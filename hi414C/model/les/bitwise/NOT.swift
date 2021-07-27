//
//  NOT.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct NOT: EquationBuilder {
    var x: EquationBuilder
    
    init(_ x: EquationBuilder = ID()) {
        self.x = x
    }
    
    func eq(_ result: UInt8) -> Equation {
        var xByte: String = ""
        
        result.toBinStr().forEach { bit in
            if bit == "1" {
                xByte += "0"
            } else {
                xByte += "1"
            }
        }
        
        let xEq = self.x.eq(UInt8.from(bin: xByte))
        let xParts = xEq.parts.withParen(!(self.x is ID))
        
        let x: UInt8 = UInt8.from(bin: xByte)
        
        let hint = bitwiseHint(for: result)
                        
        return Equation(
            x: x,
            result: result,
            builder: self,
            parts: [.SIGN(.NOT)] + xParts,
            types: [.NOT] + xEq.types,
            test: { ~x == result },
            hint: hint
        )
    }
}
