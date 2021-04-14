//
//  UInt8.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

extension UInt8 {
    func toBinStr() -> String {
        String(self, radix: 2).pad(with: "0", toLength: 8)
    }
    
    func toHexStr() -> String {
        String(self, radix: 16)
    }
    
    func getAllDenominators() -> [UInt8] {
        (1...(self/2)).filter { self % $0 == 0 } + [self]
    }
    
    func getRndDenominator() -> UInt8 {
        self.getAllDenominators().randomElement()!
    }
    
    static func from(bin: String) -> UInt8 {
        UInt8(bin, radix: 2)!
    }
}
