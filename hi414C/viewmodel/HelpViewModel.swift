//
//  HelpViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

class HelpViewModel: ObservableObject {
    private(set) var original: (id: UUID, value: Equation) = (UUID(), ID() => 0)
    @Published private(set) var equation: (id: UUID, value: Equation) = (UUID(), ID() => 0)
    
    func increment() {
        let result = equation.value.result
        let builder = equation.value.builder
        
        if result == UInt8.max {
            self.equation = (equation.id, builder.eq(0))
        } else {
            self.equation = (equation.id, builder.eq(result + 1))
        }
    }
    
    func decrement() {
        let result = equation.value.result
        let builder = equation.value.builder
        
        if result == 0 {
            self.equation = (equation.id, builder.eq(UInt8.max))
        } else {
            self.equation = (equation.id, builder.eq(result - 1))
        }
    }
    
    func rand() {
        let builder = equation.value.builder
        self.equation = (equation.id, builder.eq(UInt8.random(in: 0...UInt8.max)))
    }
    
    func reset() {
        self.equation = original
    }
        
    func resetToZero() {
        let builder = equation.value.builder
        self.equation = (equation.id, builder.eq(0))
    }
    
    func changeTo(type: EquationType) {
        let result = equation.value.result
        self.equation = (equation.id, type.build().eq(result))
    }
    
    func setEquation(id: UUID, value: Equation) {
        self.original = (id, value)
        self.equation = (id, value)
    }
}
