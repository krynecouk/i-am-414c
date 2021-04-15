//
//  SHR.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.04.2021.
//

import Foundation

struct SHR: Equation {
    var x: Equation
    var y: Equation
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
        if result == 0 {
            return ID() => 0
        }
        
        let modulo = result % 2
        let toSHR = result - modulo
        
        if modulo != 0 {
            return ADD(SHR(), (ID(), modulo)) => result
        }
        
        var multiplications = getMultiplications(from: toSHR)
        // prefer less of: >> 0000 0000
        if multiplications.count > 1 {
            multiplications = multiplications.filter { $0 != toSHR }
        }
        
        let x: UInt8 = multiplications.randomElement() ?? 0
        let y: UInt8 = x == 0 ? 0 : UInt8(log2(Double(x/result)))
                
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
        
        return EquationResult(x: x, y: y, result: result, parts: xParts + [.OP(.SHR)] + yParts, test: { x >> y == toSHR })
    }
    
    func getMultiplications(from value: UInt8, max: UInt8 = UInt8.max) -> [UInt8] {
        var current: UInt16 = UInt16(value)
        var result: [UInt8] = []
        while current != 0 && current <= max {
            result.append(UInt8(current))
            current = current * 2
        }
        return result
    }
}
