//
//  ADD.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

struct ADD: Equation {
    var x: (equation: Equation, result: UInt8?)
    var y: (equation: Equation, result: UInt8?)
    
    init(_ x: Equation = ID(), _ y: Equation = ID()) {
        self.init((x, .none), (y, .none))
    }
    
    init(_ x: (Equation, UInt8?), _ y: Equation) {
        self.init(x, (y, .none))
    }
    
    init(_ x: Equation, _ y: (Equation, UInt8?)) {
        self.init((x, .none), y)
    }
    
    init(_ x: (Equation, UInt8?), _ y: (Equation, UInt8?)) {
        self.x = x
        self.y = y
    }
    
    func eq(_ result: UInt8) -> EquationResult {
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
                
        return EquationResult(x: x, y: y, result: result, parts: xParts + [.OP(.ADD)] + yParts, test: { x + y == result })
    }
}
