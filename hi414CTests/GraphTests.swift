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
        let root = ASCIINode("HI") {
            ASCIIEdge("I", variants: ["I?"]) {
                FooNode("FooNodeOfEdge1")
            }
            ASCIIEdge("rootEdge2") {
                ASCIINode("ASCIINODeOfEdge2")
            }
        }
        
        print("nodes", root)
        
        XCTAssertEqual("123", "FooNodeOfEdge1", "Should be 123")
    }
}
