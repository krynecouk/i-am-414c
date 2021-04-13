//
//  ID.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct ID: Equation {
    func eq(_ result: UInt8) -> EquationResult {
        EquationResult(x: .none, y: .none, result: result, text: result.toByteStr())
    }
}
