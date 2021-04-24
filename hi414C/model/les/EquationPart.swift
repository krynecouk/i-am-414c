//
//  EquationPart.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.04.2021.
//

typealias EquationParts = [EquationPart]

enum EquationPart {
    case LP, NUM(UInt8), RP, SYM(EquationSymbol), RESULT(UInt8)
}

enum EquationSymbol: String {
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
            ? (self.parts + [.SYM(.EQ), .RESULT(self.result)]).toString(radix: (radix, result.radix))
            : self.parts.toString(radix: (radix, result.radix))
    }
}

extension EquationParts {
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
        case let .SYM(symbol):
            return symbol.rawValue
        case let .RESULT(num):
            if radix.result == .bin {
                return num.toBinStr()
            } else if radix.result == .hex {
                return num.toHexStr().uppercased()
            } else {
                return String(num)
            }
        }
    }
}
