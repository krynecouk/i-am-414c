//
//  EquationTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

import XCTest

@testable import hi414C

class EquationTests: XCTestCase {
    
    func test_of_OR_equations() {
        let result =
            OR(
                AND(
                    OR(),
                    OR()
                )
            ) => 65
        print(result)
        print(result.x | result.y)
        print(result.x | result.y == result.result)
    }
}
