//
//  UInt8.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

extension UInt8 {
    func toByteStr() -> String {
        String(self, radix: 2).pad(with: "0", toLength: 8)
    }
}
