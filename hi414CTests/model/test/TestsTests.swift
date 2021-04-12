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
      //  XCTAssertEqual(Tests[.A][0].test, "01000001", "binary of ASCII symbol A is 01000001")
      //  XCTAssertEqual(Tests[.A][0].solve(with: "65"), TestResult.right, "solve correctly test") // TODO not right
      //  XCTAssertEqual(Tests[.A][0].solve(with: "78"), TestResult.wrong("solution '65' is different from the provided answer '78'"), "solve correctly test")
    }
    
    func test_Foo() {
        let hex: UInt8 = 0x4C
        let bin: UInt8 = 0b0100_1100
        print("hex: ", hex >> 1)
        print("bin: ", bin >> 1)
    }
    
    /*
     convenience init(symbol: ASCIISymbol) {
         let ascii = ASCII.from(symbol)
         self.init(symbol: ascii.symbol, test: String(ascii.bin, radix: 2).pad(with: "0", toLength: 8), type: .bin, level: .easy, solution: String(ascii.dec))
     }

     init(symbol: ASCIISymbol, test: String, type: TestType, level: TestLevel, solution: String) {
         self.symbol = symbol
         self.test = test
         self.type = type
         self.level = level
         self.solution = solution
     }

     func solve(with answer: String) -> TestResult {
         solution == answer
             ? .right
             : .wrong("solution '\(solution)' is different from the provided answer '\(answer)'")
     }
     */
}
