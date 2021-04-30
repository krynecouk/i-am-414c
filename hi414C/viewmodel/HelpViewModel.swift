//
//  HelpViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

class HelpViewModel: ObservableObject {
    var originalEq: HelpEquation = HelpEquation(equation: ID() => 0)
    @Published var updatedEq: HelpEquation?
    
    func increment() {
        let item = updatedEq ?? originalEq
        let result = item.equation.result
        let builder = item.equation.builder
        
        if result == UInt8.max {
            self.updatedEq = HelpEquation(equation: builder.eq(0))
        } else {
            self.updatedEq = HelpEquation(equation: builder.eq(result + 1))
        }
    }
    
    func decrement() {
        /*
         let result = equation.value.result
         let builder = equation.value.builder
         
         if result == 0 {
         self.equation = (equation.id, builder.eq(UInt8.max))
         } else {
         self.equation = (equation.id, builder.eq(result - 1))
         }
         */
    }
    
    func rand() {
        /*
         let builder = equation.value.builder
         self.equation = (equation.id, builder.eq(UInt8.random(in: 0...UInt8.max)))
         */
    }
    
    func reset() {
        /*
         self.updatedEq = originalEq
         */
    }
    
    func resetToZero() {
        /*
         let builder = equation.value.builder
         self.equation = (equation.id, builder.eq(0))
         */
    }
    
    func changeTo(type: EquationType) {
        let item = updatedEq ?? originalEq
        let result = item.equation.result
        self.updatedEq = HelpEquation(equation: type.build().eq(result))
    }
    
    func setEquation(id: UUID, equation: Equation) {
        self.originalEq = HelpEquation(id: id, equation: equation)
        self.updatedEq = HelpEquation(id: id, equation: equation)
    }
    
    
}
struct HelpEquation: Identifiable {
    var id: UUID = UUID()
    var equation: Equation
}
