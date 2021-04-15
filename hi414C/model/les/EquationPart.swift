//
//  EquationPart.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 14.04.2021.
//

typealias EquationParts = [EquationPart]

enum EquationPart {
    case LP, NUM(UInt8), RP, OP(EquationOperator)
}

enum EquationOperator: String {
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
}

extension Equation {
    func toString(radix: EquationRadix = .bin) -> String {
        self.parts.toString(radix: radix)
    }
}

extension EquationParts {
    func withParen(_ flag: Bool = true) -> Self {
        flag ? [.LP] + self + [.RP] : self
    }
    
    func toString(radix: EquationRadix = .bin) -> String {
        self.map { $0.toString() }.joined()
    }
}

extension EquationPart {
    func toString(radix: EquationRadix = .bin) -> String {
        switch self {
        case .LP:
            return "("
        case let .NUM(num):
            return radix == .bin ? num.toBinStr() : num.toHexStr().uppercased()
        case .RP:
            return ")"
        case let .OP(op):
            return op.rawValue
        }
    }
}
