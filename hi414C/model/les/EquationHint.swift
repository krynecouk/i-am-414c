//
//  EquationHint.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 25.07.2021.
//

struct EquationHint {
    var bin: EquationParts
    var hex: EquationParts
    
    func of(radix: EquationRadix) -> EquationParts {
        switch radix {
        case .bin:
            return self.bin
        case .hex:
            return self.hex
        case .dec:
            print("dec hint not supported")
            return []
        }
    }
}
