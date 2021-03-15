//
//  ASCIITest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

class ASCIITest: Testable {
    var symbol: ASCIISymbol
    var test: String
    var type: TestType
    var level: TestLevel
    var solution: String

    convenience init(symbol: ASCIISymbol) {
        let ascii = ASCII.from(symbol: symbol)
        self.init(symbol: ascii.symbol, test: String(ascii.bin, radix: 2).pad(with: "0", toLength: 8), type: .bin, level: .easy, solution: ascii.symbol.rawValue)
    }

    init(symbol: ASCIISymbol, test: String, type: TestType, level: TestLevel, solution: String) {
        self.symbol = symbol
        self.test = test
        self.type = type
        self.level = level
        self.solution = solution
    }

    func solve(with answer: String) -> TestSolution {
        solution == answer
            ? .right
            : .wrong("solution '\(solution)' is different from the provided answer '\(answer)'")
    }
}
