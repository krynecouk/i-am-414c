//
//  Tests.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

struct Tests {
    static private(set) var current: ASCIITest?
    
    static func setCurrent(test: ASCIITest?) {
        current = test
    }
}
