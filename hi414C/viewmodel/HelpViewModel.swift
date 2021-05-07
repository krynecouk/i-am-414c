//
//  HelpViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

class HelpViewModel: ObservableObject {
    @Published private(set) var updatedEq: HelpEquation?
    @Published var isHistory: Bool = false
    @Published private(set) var answers: Int = 0
    
    private(set) var originalEq: HelpEquation = HelpEquation(equation: ID() => 0)
    private(set) var radix: EquationRadix?
    
    func increment() {
        let (result, builder) = getResultBuilder()
        if result == UInt8.max {
            self.updatedEq = HelpEquation(equation: builder.eq(0))
        } else {
            self.updatedEq = HelpEquation(equation: builder.eq(result + 1))
        }
    }
    
    func decrement() {
        let (result, builder) = getResultBuilder()
        if result == 0 {
            self.updatedEq = HelpEquation(equation: builder.eq(UInt8.max))
        } else {
            self.updatedEq = HelpEquation(equation: builder.eq(result - 1))
        }
    }
    
    func rand() {
        let (_, builder) = getResultBuilder()
        self.updatedEq = HelpEquation(equation: builder.eq(UInt8.random(in: 0...UInt8.max)))
    }
    
    func reset() {
        self.updatedEq = originalEq
    }
    
    func resetToZero() {
        let (_, builder) = getResultBuilder()
        self.updatedEq = HelpEquation(equation: builder.eq(0))
    }
    
    func changeTo(type: EquationType) {
        let (result, _) = getResultBuilder()
        self.updatedEq = HelpEquation(equation: type.build().eq(result))
    }
    
    func setOriginalEq(id: UUID, equation: Equation) {
        self.originalEq = HelpEquation(id: id, equation: equation)
    }
    
    func setUpdatedEq(id: UUID, equation: Equation) {
        self.updatedEq = HelpEquation(id: id, equation: equation)
    }
    
    func removeUpdatedEq() {
        self.updatedEq = nil
    }
    
    func randAnswer() {
        self.answers += 1
    }
    
    func setRadix(radix: EquationRadix?) {
        self.radix = radix
    }
    
    private func getResultBuilder() -> (result: UInt8, builder: EquationBuilder) {
        let item = updatedEq ?? originalEq
        let result = item.equation.result
        let builder = getBuilder(item.equation)
        return (result, builder)
    }
    
    private func getBuilder(_ equation: Equation) -> EquationBuilder {
        if equation.types.contains(.SHL) {
            return SHL()
        } else if equation.types.contains(.SHR) {
            return SHR()
        } else {
            return equation.builder
        }
    }
}


struct HelpEquation: Identifiable {
    var id: UUID = UUID()
    var equation: Equation
}
