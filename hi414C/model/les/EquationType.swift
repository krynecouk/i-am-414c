//
//  EquationType.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.04.2021.
//


enum EquationType: CaseIterable {
    typealias id = ID
    typealias add = ADD
    typealias sub = SUB
    typealias div = DIV
    typealias mul = MUL
    typealias and = AND
    typealias or = OR
    typealias xor = XOR
    typealias not = NOT
    typealias shl = SHL
    typealias shr = SHR
    
    case ID, AND, OR, XOR, NOT, SHL, SHR, ADD, SUB, DIV, MUL
    
    func build(x: EquationType = .ID, y: EquationType = .ID) -> EquationBuilder {
        return self.builder(x: x.builder(), y: y.builder())
    }
    
    static func rand(of types: [EquationType] = [AND, OR, XOR, NOT, SHL, SHR, ADD, SUB, DIV, MUL], withId: Bool = false) -> EquationType {
        withId ? (types + [ID]).randomElement()! : types.randomElement()!
    }
    
    private func builder(x: EquationBuilder = id(), y: EquationBuilder = id()) -> EquationBuilder {
        switch self {
        case .ID:
            return id()
        case .AND:
            return and(x, y)
        case .OR:
            return or(x, y)
        case .XOR:
            return xor(x, y)
        case .NOT:
            return not(x)
        case .SHL:
            return shl(x, y)
        case .SHR:
            return shr(x, y)
        case .ADD:
            return add(x, y)
        case .SUB:
            return sub(x, y)
        case .DIV:
            return div(x, y)
        case .MUL:
            return mul(x, y)
        }
    }
}
