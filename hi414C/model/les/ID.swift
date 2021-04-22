//
//  ID.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct ID: EquationBuilder {
    func eq(_ result: UInt8) -> Equation {
        Equation(x: result, result: result, parts: [.NUM(result)], types: [.ID], test: { result == result })
    }
}
