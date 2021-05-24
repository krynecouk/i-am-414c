//
//  HelpViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

class HelpViewModel: ObservableObject {
    @Published var current: HelpContent = .learn
    @Published private(set) var equation: Equation = ID() => 0
    @Published private(set) var radix: EquationRadix = .bin
    @Published private(set) var answers: Int = 0
    
    func increment() {
        let (result, builder) = getResultBuilder()
        if result == UInt8.max {
            self.equation = builder.eq(0)
        } else {
            self.equation = builder.eq(result + 1)
        }
    }
    
    func decrement() {
        let (result, builder) = getResultBuilder()
        if result == 0 {
            self.equation = builder.eq(UInt8.max)
        } else {
            self.equation = builder.eq(result - 1)
        }
    }
    
    func rand() {
        let (_, builder) = getResultBuilder()
        self.equation = builder.eq(UInt8.random(in: 0...UInt8.max))
    }
    
    func resetToZero() {
        let (_, builder) = getResultBuilder()
        self.equation = builder.eq(0)
    }
    
    func change(to type: EquationType) {
        let (result, _) = getResultBuilder()
        self.equation = type.build().eq(result)
    }
    
    func randAnswer() {
        self.answers += 1
    }
    
    func radix(of radix: EquationRadix) {
        self.radix = radix
    }
        
    func getResultBuilder() -> (result: UInt8, builder: EquationBuilder) {
        let result = equation.result
        let builder = getBuilder(equation)
        return (result, builder)
    }
    
    func getBuilder(_ equation: Equation) -> EquationBuilder {
        if equation.types.contains(.SHL) {
            return SHL()
        } else if equation.types.contains(.SHR) {
            return SHR()
        } else {
            return equation.builder
        }
    }
    
    enum HelpContent {
        case learn, chat, settings_font, settings_theme, settings_delete
    }
}
