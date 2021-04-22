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
    
    func test_of_equation_types() {
        let equation = AND(OR(NOT()), XOR()) => 100
        let types = equation.types
        XCTAssertEqual(types.contains(.AND), true, "equation \(equation.toString()) contains AND operator")
        XCTAssertEqual(types.contains(.OR), true, "equation \(equation.toString()) contains OR operator")
        XCTAssertEqual(types.contains(.NOT), true, "equation \(equation.toString()) contains NOT operator")
        XCTAssertEqual(types.contains(.XOR), true, "equation \(equation.toString()) contains XOR operator")
        XCTAssertEqual(types.contains(.ID), true, "equation \(equation.toString()) contains ID operator")
        
        XCTAssertEqual(types.contains(.ADD), false, "equation \(equation.toString()) does not contains ADD operator")
        XCTAssertEqual(types.contains(.SUB), false, "equation \(equation.toString()) does not contains SUB operator")
        XCTAssertEqual(types.contains(.DIV), false, "equation \(equation.toString()) does not contains DIV operator")
        XCTAssertEqual(types.contains(.MUL), false, "equation \(equation.toString()) does not contains MUL operator")
        XCTAssertEqual(types.contains(.SHL), false, "equation \(equation.toString()) does not contains SHL operator")
        XCTAssertEqual(types.contains(.SHR), false, "equation \(equation.toString()) does not contains SHR operator")
    }
    
    func test(_ builder: EquationBuilder, debug: Bool = false) {
        test(builder.eq(0), debug: debug)
        tests.forEach { _ in
            test(builder.eq(UInt8.random(in: 1..<UInt8.max)), debug: debug)
        }
        test(builder.eq(UInt8.max), debug: debug)
    }
    
    func test(_ equation: Equation, debug: Bool = false) {
        if debug {
            print("\(equation.toString())=\(equation.result) (\(equation.test()))")
        }
        XCTAssertEqual(equation.test(), true, "equation \(equation.toString()) was not equal to \(equation.result); x = \(equation.x), y = \(equation.y), result = \(equation.result)")
    }
}
