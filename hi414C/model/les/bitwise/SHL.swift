//
//  SHL.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct SHL: Equation {
    var x: Equation
    var y: Equation
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        if result % 2 != 0 {
            print("BIT WILL LOST")
        }
        
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
        
        let xText = self.x is ID ? xResult.text : "(\(xResult.text))"
        let yText = self.y is ID ? yResult.text : "(\(yResult.text))"
                
        return EquationResult(x: UInt8.from(bin: xByte), y: UInt8.from(bin: yByte), result: result, text: "\(xText)&\(yText)")
    }
}
