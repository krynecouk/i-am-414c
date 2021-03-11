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
        let root = ASCIINode("123") {
            ASCIINode("456") {
                BarNode("BarNodeHere")
            }
        }
        
        print("nodes", root)
        
        XCTAssertEqual(root.id, "123", "Should be 123")
    }
    
    
    struct BarNode : Node {
        var id: String
        
        init(_ id: String) {
            self.id = id
        }
        
        var body: [Node] {
            ASCIINode("789")
            FooNode("FooNode")
        }
    }
}
