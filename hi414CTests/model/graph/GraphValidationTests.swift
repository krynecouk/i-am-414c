//
//  GraphValidationTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 03.06.2021.
//

import XCTest

@testable import hi414C

class GraphValidationTests: XCTestCase {
    
    var visited: Set<String> = []

    override func setUpWithError() throws {
        visited = []
    }

    func testExample() throws {
        walkGraph(node: Graphs.BIN)
    }
    
    func walkGraph(node: Node) {
        for edge in node.edges {
            print(edge.id)
            //XCTAssertFalse(visited.contains(edge.id), "Graph already contains edge with id \"\(edge.id)\"")
            visited.insert(edge.id)
            walkGraph(node: edge.target)
        }
    }
}
