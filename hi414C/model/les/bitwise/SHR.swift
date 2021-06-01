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
        var x: UInt8
        var y: UInt8
        
        let resultStr = result.toBinStr()
        let leading0 = resultStr.index(of: "1")
        
        if result == 0 {
            x = 0
            y = 0
        } else if leading0 == 0 || leading0 == nil {
            x = result
            y = 0
        } else {
            y = UInt8((1...leading0!).randomElement()!)
            let resultWithoutLeading0 = resultStr.substring(from: y)
            let trailing0 = (0..<y).map { _ in "0" }.joined()
            x = UInt8.from(bin: resultWithoutLeading0 + trailing0)
        }
      
        let xResult = self.x.eq(x)
        let yResult = self.y.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x is ID))
        let yParts = yResult.parts.withParen(!(self.y is ID))
        
        return Equation(x: x, y: y, result: result, builder: self, parts: xParts + [.SIGN(.SHR)] + yParts, types: [.SHR] + xResult.types + yResult.types, test: { x >> y == result })
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
