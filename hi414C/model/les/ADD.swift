//
//  ADD.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct ADD: Equation {
    func eq(_ result: UInt8) -> EquationResult {
        var x: String = ""
        var y: String = ""
        
        result.toByteStr().forEach { ch in
            if ch == "1" {
                x += "1"
                y += "1"
            } else {
                let rnd = Int.random(in: 0...1)
                x += String(rnd)
                y += rnd == 1 ? "0" : "1"
            }
        }
        
        return EquationResult(x: UInt8(x, radix: 2)!, y: UInt8(y, radix: 2)!, result: result, text: "\(x)&\(y)")
    }
}
