//
//  TestViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

class TestViewModel: ObservableObject {
    typealias ET = EquationType
    
    @Published private(set) var result: TestResult = .right(.NUL)
    @Published private(set) var radix: EquationRadix = RadixDao.find() ?? .bin
    @Published private(set) var difficulty: TestDifficulty = TestDifficultyDao.find() ?? .easy
    
    // IMPORTANT: must not be published
    private(set) var test: Test? = .none
    private(set) var level: Int = TestDao.find() ?? 0
        
    func set(test: Test?) {
        if let test = self.test {
            print("current test: ", test.equation.toString())
        }
        self.test = test
    }
    
    func radix(of type: EquationRadix) {
        self.radix = type
        RadixDao.store(self.radix)
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
        
        if self.difficulty == .medium {
            return Test(symbol: symbol, equation: ET.optimalRand(for: dec).build(x: ET.rand()).eq(dec))
        }
        
        if self.difficulty == .hard {
            return Test(symbol: symbol, equation: ET.optimalRand(for: dec).build(x: ET.rand(), y: ET.rand()).eq(dec))
        }
        
        switch level {
        case 0..<3:
            return Test(symbol: symbol, equation: ID() => dec)
        case 0..<4:
            return Test(symbol: symbol, equation: ET.rand(of: [.ADD, .SUB]).build().eq(dec))
        case 0..<5:
            return Test(symbol: symbol, equation: ET.rand(of: [.MUL, .DIV]).build().eq(dec))
        case 0..<6:
            return Test(symbol: symbol, equation: AND() => dec)
        case 0..<7:
            return Test(symbol: symbol, equation: OR() => dec)
        case 0..<8:
            return Test(symbol: symbol, equation: XOR() => dec)
        case 0..<9:
            return Test(symbol: symbol, equation: NOT() => dec)
        case 0..<11:
            if dec % 2 == 0 {
                return Test(symbol: symbol, equation: SHL() => dec)
            } else {
                return Test(symbol: symbol, equation: SHR() => dec)
            }
        default:
            return Test(symbol: symbol, equation: ET.optimalRand(for: dec).build().eq(dec))
        }
    }
    
    func difficulty(_ difficulty: TestDifficulty) {
        self.difficulty = difficulty
        TestDifficultyDao.store(self.difficulty)
    }
    
    func storeLevel() {
        TestDao.store(self.level)
    }
    
    func storeProgress(_ progress: Progress) {
        ProgressDao.store(progress)
    }
    
    func restoreLevel() {
        self.level = TestDao.find() ?? 0
    }
    
    func level(reset: Bool = false, up: Int = 0, down: Int = 0) {
        if reset {
            self.level = 0
        }
        if up != 0 || down != 0 {
            self.level += (up + down)
            print("leveling up to \(self.level)")
        }
        print("TEST LEVEL: ", self.level)
    }
}

enum TestDifficulty: String, Storable {
    case easy, medium, hard
}
