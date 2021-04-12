//
//  ADDTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 12.04.2021.
//

import XCTest

@testable import hi414C

class ADDTests: XCTestCase {

    func test_of_ADD_equations() {
        let result = ADD() => 65
        print(result)
        print(result.x & result.y)
        print(result.x & result.y == result.result)
    }
}
