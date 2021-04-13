//
//  MUL.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.04.2021.
//

import Foundation

func getAllDenominators(for value: UInt8) -> [UInt8] {
    (1...(value/2)).filter { value % $0 == 0 } + [value]
}
