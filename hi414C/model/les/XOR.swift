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
        
        result.toByteStr().forEach { bit in
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
        
        let xText = self.x is ID ? xResult.text : "(\(xResult.text))"
        let yText = self.y is ID ? yResult.text : "(\(yResult.text))"
        
        return EquationResult(x: UInt8.from(bin: xByte), y: UInt8.from(bin: yByte), result: result, text: "\(xText)^\(yText)")
    }
}
