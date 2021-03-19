//
//  TestsTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 15.03.2021.
//

import XCTest

@testable import hi414C

class ASCIITestsTests: XCTestCase {

    func test_Tests_contains_binary_test_for_A_symbol() {
        XCTAssertEqual(Tests[.A][0].test, "01000001", "binary of ASCII symbol A is 01000001")
        XCTAssertEqual(Tests[.A][0].solve(with: "A"), TestSolution.right, "solve correctly test") // TODO not right
        XCTAssertEqual(Tests[.A][0].solve(with: "B"), TestSolution.wrong("solution 'A' is different from the provided answer 'B'"), "solve correctly test")
    }
}
