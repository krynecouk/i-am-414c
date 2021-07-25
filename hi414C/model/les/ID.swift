//
//  ID.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

struct ID: EquationBuilder {
    func eq(_ result: UInt8) -> Equation {
        Equation(x: result, result: result, builder: self, parts: [.NUM(result)], types: [.ID], test: { result == result }, hint: hint(result))
    }
}

extension ID {
    func hint(_ result: UInt8) -> EquationHint {
        // bin
        let indices = result.toBinStr().indices(of: "1")
        let values = indices.map { binVal(of: $0) }
        var bin: EquationParts = []
        for (i, value) in values.enumerated() {
            bin.append(.NUM(value))
            if i != values.endIndex - 1 {
                bin.append(.SIGN(.ADD))
            }
        }
        
        return EquationHint(bin: bin, hex: []) // todo
    }
    
    private func binVal(of index: Int) -> UInt8 {
        switch index {
        case 0: return 128
        case 1: return 64
        case 2: return 32
        case 3: return 16
        case 4: return 8
        case 5: return 4
        case 6: return 2
        case 7: return 1
        default: return 0
        }
    }
}
