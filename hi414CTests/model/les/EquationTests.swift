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
        let result = AND() => 65
        print(result)
        print(result.x! & result.y!)
        print(result.x! & result.y! == result.result)
    }
    
    func test_of_OR_equations() {
        let eq =
            OR(
                AND(
                    OR(),
                    OR()
                )
            ) => 97
        print(eq)
        print(eq.x! | eq.y!)
        print(eq.x! | eq.y! == eq.result)
    }
    
    func test_of_XOR_equations() {
        let eq =
            XOR(
                OR(
                    AND()
                )
            ) => 65
        print(eq)
        print(eq.x! ^ eq.y!)
        print(eq.x! ^ eq.y! == eq.result)
    }
    
    func test_of_NOT_equations() {
        let eq =
            NOT() => 65
        print(eq)
        print(~eq.x!)
        print(~eq.x! == eq.result)
    }
    
    func test_of_SHL_equations() {
        print(DIV() => 65)
        //let result = 65 << 1
        
        /*
        let eq = SHL() => 65
        print(eq)
        print(~eq.x!)
        print(~eq.x! == eq.result)
        */
    }

}
