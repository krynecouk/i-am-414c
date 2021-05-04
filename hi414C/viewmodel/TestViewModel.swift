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
    
    @Published private(set) var result: TestResult = .right(.NUL)
    
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
    
    typealias ET = EquationType
    
    func generate(for symbol: ASCIISymbol) -> Test {
        let dec = ASCII.from(symbol).dec
        
        switch level {
        case 0..<3:
            return Test(symbol: symbol, equation: AND() => dec)
        case 0..<4:
            return Test(symbol: symbol, equation: ADD() => dec)
        case 0..<5:
            return Test(symbol: symbol, equation: SUB() => dec)
        case 0..<6:
            return Test(symbol: symbol, equation: ET.rand(of: [.ADD, .SUB]).build().eq(dec))
        case 0..<7:
            return Test(symbol: symbol, equation: DIV() => dec)
        case 0..<8:
            return Test(symbol: symbol, equation: MUL() => dec)
        case 0..<9:
            return Test(symbol: symbol, equation: ET.rand(of: [.DIV, .MUL]).build().eq(dec))
        case 0..<10:
            return Test(symbol: symbol, equation: AND() => dec)
        case 0..<11:
            return Test(symbol: symbol, equation: OR() => dec)
        case 0..<12:
            return Test(symbol: symbol, equation: ET.rand(of: [.AND, .OR]).build().eq(dec))
        case 0..<13:
            return Test(symbol: symbol, equation: XOR() => dec)
        case 0..<14:
            return Test(symbol: symbol, equation: NOT() => dec)
        case 0..<15:
            return Test(symbol: symbol, equation: ET.rand(of: [.XOR, .NOT]).build().eq(dec))
        case 0..<16:
            return Test(symbol: symbol, equation: SHL() => dec)
        case 0..<17:
            return Test(symbol: symbol, equation: SHR() => dec)
        case 0..<18:
            return Test(symbol: symbol, equation: ET.rand(of: [.SHL, .SHR]).build().eq(dec))
        case 0..<30:
            return Test(symbol: symbol, equation: ET.rand().build(x: ET.rand()).eq(dec))
        default:
            return Test(symbol: symbol, equation: ET.rand().build(x: ET.rand(), y: ET.rand()).eq(dec))
        }
    }
    
    func level(up: Int = 0, down: Int = 0) {
        self.level += (up + down)
        print("leveling up to \(self.level)")
    }
}
