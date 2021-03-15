//
//  Testable.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

protocol Testable {
    var test: String { get }
    var type: TestType { get }
    var level: TestLevel { get }
    var solution: String { get }
    var solved: Bool { get set }
    func solve(with answer: String) -> TestSolution
}
