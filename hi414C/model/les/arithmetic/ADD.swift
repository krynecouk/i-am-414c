//
//  ADD.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct ADD: EquationBuilder {
    var x: (equation: EquationBuilder, result: UInt8?)
    var y: (equation: EquationBuilder, result: UInt8?)
    
    init(_ x: EquationBuilder = ID(), _ y: EquationBuilder = ID()) {
        self.init((x, .none), (y, .none))
    }
    
    init(_ x: (EquationBuilder, UInt8?), _ y: EquationBuilder) {
        self.init(x, (y, .none))
    }
    
    init(_ x: EquationBuilder, _ y: (EquationBuilder, UInt8?)) {
        self.init((x, .none), y)
    }
    
    init(_ x: (EquationBuilder, UInt8?), _ y: (EquationBuilder, UInt8?)) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> Equation {
        var y: UInt8
        var x: UInt8
        if result == 0 {
            y = 0
            x = 0
        } else if result == 1 {
            y = 1
            x = 0
        } else {
            y = self.y.result ?? UInt8.random(in: 1..<result)
            x = self.x.result ?? result - y
        }

        let xResult = self.x.equation.eq(x)
        let yResult = self.y.equation.eq(y)
        
        let xParts = xResult.parts.withParen(!(self.x.equation is ID))
        let yParts = yResult.parts.withParen(!(self.y.equation is ID))
        
        let hint = EquationHint(
            bin: xResult.hint.bin.withParen() + [.SIGN(.ADD)] + yResult.hint.bin.withParen(),
            hex: xResult.hint.bin.withParen() + [.SIGN(.ADD)] + yResult.hint.bin.withParen())

        return Equation(
            x: x,
            y: y,
            result: result,
            builder: self,
            parts: xParts + [.SIGN(.ADD)] + yParts,
            types: [.ADD] + xResult.types + yResult.types, test: { x + y == result },
            hint: hint)
    }
}
