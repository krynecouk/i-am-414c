//
//  Equation.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

infix operator =>

protocol Equation {
    func eq(_ result: UInt8) -> EquationResult
}

extension Equation {
    static func => (equation: Self, result: UInt8) -> EquationResult {
        equation.eq(result)
    }
}
