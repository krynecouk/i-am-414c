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
        let onesIdx = result.toBinStr().indices(of: "1")
        let onesValues = onesIdx.map { binVal(of: $0) }
        var binHint: EquationParts = []
        if onesValues.isEmpty {
            binHint.append(.NUM(0))
        } else {
            for (i, value) in onesValues.enumerated() {
                binHint.append(.NUM(value))
                if i != onesValues.endIndex - 1 {
                    binHint.append(.SIGN(.ADD))
                }
            }
        }

        // hex
        let hexValues = Array(result.toHexStr())
        var hexHint: EquationParts = []
        for (i, value) in hexValues.enumerated() {
            if value == "0" {
                continue
            }
            hexHint.append(.NUM(hexVal(of: value)))
            let last = i == hexValues.endIndex - 1
            if !last {
                hexHint.append(.SIGN(.MUL))
                hexHint.append(.NUM(16))
                if hexValues[i + 1] != "0" {
                    hexHint.append(.SIGN(.ADD))
                }
            }
        }
        if hexHint.isEmpty {
            hexHint.append(.NUM(0))
        }
        return EquationHint(bin: binHint, hex: hexHint)
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
    
    private func hexVal(of hex: Character) -> UInt8 {
        switch hex {
        case "0": return 0
        case "1": return 1
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
        case "A": return 10
        case "B": return 11
        case "C": return 12
        case "D": return 13
        case "E": return 14
        case "F": return 15
        default: return 0
        }
    }
}
