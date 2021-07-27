//
//  EquationPart.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.04.2021.
//

typealias EquationParts = [EquationPart]

enum EquationPart {
    case LP, NUM(UInt8), RP, SIGN(EquationSign), RESULT(UInt8), UNKNOWN
}

enum EquationSign: String {
    case ADD = "+"
    case SUB = "-"
    case DIV = "/"
    case MUL = "*"
    case AND = "&"
    case OR = "|"
    case XOR = "^"
    case NOT = "~"
    case SHL = "<<"
    case SHR = ">>"
    case EQ = "="
}

extension Equation {
    func toString(radix: EquationRadix = .bin, result: (visible: Bool, radix: EquationRadix) = (false, .bin)) -> String {
        result.visible
            ? (self.parts + [.SIGN(.EQ), .RESULT(self.result)]).toString(radix: (radix, result.radix))
            : self.parts.toString(radix: (radix, result.radix))
    }
}

extension EquationBuilder {
    func bitwiseHint(for result: UInt8) -> EquationHint {
        // bin
        let binStr = result.toBinStr()
        var bin: [EquationPart] = Array(binStr).map { .NUM($0 == "1" ? 1 : 0) }
        let rndIdx1 = Int.random(in: 0...7)
        //let rndIdx2 = Int.random(in: 0...7)
        bin[rndIdx1] = .UNKNOWN
        //bin[rndIdx2] = .UNKNOWN
        // hex
        
        return EquationHint(bin: bin, hex: bin)
    }
}

extension EquationParts {
    func withParenIfNeeded() -> Self {
        self.withParen(self.count > 1)
    }
    
    func withParen(_ flag: Bool = true) -> Self {
        flag ? [.LP] + self + [.RP] : self
    }
    
    func toString(radix: (body: EquationRadix, result: EquationRadix)) -> String {
        self.map { $0.toString(radix) }.joined()
    }
}

extension EquationPart {
    func toString(_ radix: (body: EquationRadix, result: EquationRadix)) -> String {
        switch self {
        case .LP:
            return "("
        case let .NUM(num):
            if radix.body == .bin {
                return num.toBinStr()
            } else if radix.body == .hex {
                return num.toHexStr().uppercased()
            } else {
                return String(num)
            }
        case .RP:
            return ")"
        case let .SIGN(symbol):
            return symbol.rawValue
        case let .RESULT(num):
            if radix.result == .bin {
                return num.toBinStr()
            } else if radix.result == .hex {
                return num.toHexStr().uppercased()
            } else {
                return String(num)
            }
        case .UNKNOWN:
            return "?"
        }
    }
}
