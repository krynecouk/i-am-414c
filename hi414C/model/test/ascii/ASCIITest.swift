//
//  ASCIITest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

class ASCIITest: Testable {
    var test: String
    var type: TestType
    var level: TestLevel
    var solution: String
    var solved: Bool
    
    init(test: String, type: TestType, level: TestLevel, solution: String, solved: Bool = false) {
        self.test = test
        self.type = type
        self.level = level
        self.solution = solution
        self.solved = solved
    }
    
    func solve(with answer: String) -> TestSolution {
        if (solution == answer) {
            self.solved = true
            return .right
        }
        return .wrong("solution '\(solution)' is different from the provided answer '\(answer)'")
    }
}
