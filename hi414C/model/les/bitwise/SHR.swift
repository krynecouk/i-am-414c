//
//  SHR.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.04.2021.
//

import Foundation

struct SHR: EquationBuilder {
    var x: EquationBuilder
    var y: EquationBuilder
    
    init(_ x: EquationBuilder = ID(), _ y: EquationBuilder = ID()) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> Equation {
        // TODO wrong - compute empty places before 1 and random
        var x: UInt8
        var y: UInt8
        var toSHR: UInt8
        
        if result == 0 {
            x = 0
            y = 0
            toSHR = 0
        } else {
            let modulo = result % 2
            toSHR = result - modulo
            
            if modulo != 0 {
                return ADD(SHR(), (ID(), modulo)) => result
            }
            
            var multiplications = getMultiplications(from: toSHR)
            // prefer less of: >> 0000 0000
            if multiplications.count > 1 {
                multiplications = multiplications.filter { $0 != toSHR }
            }
            
            x = multiplications.randomElement() ?? 0
            y = x == 0 ? 0 : UInt8(log2(Double(x/result)))
        }
      
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
        
        return Equation(x: x, y: y, result: result, builder: self, parts: xParts + [.SIGN(.SHR)] + yParts, types: [.SHR] + xResult.types + yResult.types, test: { x >> y == toSHR })
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
