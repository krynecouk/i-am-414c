//
//  TestViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

class TestViewModel: ObservableObject {
    private(set) var test: Test? = .none
    private(set) var level: Int = 0
    private(set) var equations: [EquationType] = []
    
    @Published private(set) var result: TestResult = .right(.questionMark)
    
    func set(test: Test?) {
        if let test = self.test {
            print("current test: ", test.equation.toString())
        }
        self.test = test
    }
    
    func solve(with value: String) -> TestResult {
        if let test = self.test {
            self.result = test.equation.result == UInt8(value) ? .right(test.symbol) : .wrong("wrong result \(value)")
        } else {
            self.result = .wrong("No test was provided")
        }
        print("test solved with \(self.result)")
        return self.result
    }
    
    func generate(for symbol: ASCIISymbol) -> Test {
        let dec = ASCII.from(symbol).dec
        switch level {
        case 0..<2:
            return Test(symbol: symbol, equation: EquationType.rand().build(x: .ADD).eq(dec))
        case 0..<4:
            return Test(symbol: symbol, equation: AND() => dec)
        case 0..<6:
            return Test(symbol: symbol, equation: OR() => dec)
        default:
            return Test(symbol: symbol, equation: ID() => dec)
        }
    }
    
    func level(up: Int = 0, down: Int = 0) {
        self.level += (up + down)
        print("leveling up to \(self.level)")
    }
}
