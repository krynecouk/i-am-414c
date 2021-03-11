//
//  GraphTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import XCTest

@testable import hi414C

class GraphTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFoo() {
        typealias N = ASCIINode
        typealias E = ASCIIEdge
        
        let root =
            N("HI") {
                E("I", variants: ["I?"]) {
                    N("AL")
                }
                E("Foo") {
                    N("Bar") {
                        E("Baz") {
                            N("BAZZZZ")
                        }
                    }
                }
            }
        
        print("nodes", root)
        
        XCTAssertEqual("123", "FooNodeOfEdge1", "Should be 123")
    }
}
