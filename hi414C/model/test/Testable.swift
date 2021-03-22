//
//  Testable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

protocol Testable {
    var symbol: ASCIISymbol { get }
    var test: String { get }
    var type: TestType { get }
    var level: TestLevel { get }
    var solution: String { get }
    func solve(with answer: String) -> TestResult
}
