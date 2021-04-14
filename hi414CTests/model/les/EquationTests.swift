//
//  EquationTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

import XCTest

@testable import hi414C

class EquationTests: XCTestCase {
    
    let tests = (0...10_000)
    
    func test_of_AND() {
        test(AND(), debug: false)
    }
    
    func test_of_OR() {
        test(OR(), debug: false)
    }
    
    func test_of_XOR() {
        test(XOR(), debug: false)
    }
    
    func test_of_NOT() {
        test(NOT(), debug: false)
    }
    
    func test_of_SHL() {
        test(SHL(), debug: false)
    }
    
    func test_of_SHR() {
        test(SHR(), debug: false)
    }
    
    func test_of_ADD() {
        test(ADD(), debug: false)
    }
    
    func test_of_SUB() {
        test(SUB(), debug: false)
    }
    
    func test_of_DIV() {
        test(DIV(), debug: false)
    }
    
    func test_of_MUL() {
        test(MUL(), debug: false)
    }
    
    func test_of_multi_equation() {
        test(
            AND(
                SHL(
                    OR(), SHR()
                ),
                XOR(
                    NOT(), MUL()
                )
            ),
            debug: false
        )
    }
    
    func test(_ equation: Equation, debug: Bool = false) {
        tests.forEach { _ in
            test_one_equation_result(equation.eq(UInt8.random(in: 0...128)), debug: debug)
        }
    }
    
    func test_one_equation_result(_ result: EquationResult, debug: Bool = false) {
        if debug {
            print("\(result.toString())=\(result.result) (\(result.test()))")
        }
        XCTAssertEqual(result.test(), true, "equation \(result.toString()) was not equal to \(result.result); x = \(result.x), y = \(result.y), result = \(result.result)")
    }
}
