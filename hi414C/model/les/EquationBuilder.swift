//
//  EquationBuilder.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

infix operator =>

protocol EquationBuilder {
    func eq(_ result: UInt8) -> Equation
}

extension EquationBuilder {
    static func => (equation: Self, result: UInt8) -> Equation {
        equation.eq(result)
    }
}
