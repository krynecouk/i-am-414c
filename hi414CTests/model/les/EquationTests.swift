//
//  EquationTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

import XCTest

@testable import hi414C

class EquationTests: XCTestCase {
    
    func test_of_ADD_equations() {
        let result = AND(OR(), AND()) => 65
        print(result)
        print(result.x & result.y)
        print(result.x & result.y == result.result)
        print(result.toString())
        print(result.test())
    }
}
