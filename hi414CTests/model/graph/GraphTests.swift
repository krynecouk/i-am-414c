//
//  GraphTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import XCTest

@testable import hi414C

class GraphTests: XCTestCase {
    typealias N = TestNode
    typealias E = TestEdge
    
    static let tested: Node =
        N("HI") {
            E("HI") {
                N("HI")
            }
            E("I") {
                N("AL") {
                    E("AL?") {
                        N("YES")
                    }
                }
            }
            E("AL") {
                N("YOU") {
                    E("AL?") {
                        N("YES")
                    }
                }
            }
            E("YOU") {
                N("414C") {
                    E("414C?") {
                        N("YES")
                    }
                }
            }
            E("414C") {
                N("I")
            }
        }
    
    func test_graph_contains_all_the_nodes_and_edges() {
        print("tested graph: ", GraphTests.tested)
        
        XCTAssertEqual(GraphTests.tested.name, "HI", "Root node should have id 'HI'")
        XCTAssertEqual(GraphTests.tested.edges.count, 5, "Root node should have 5 edges")
        XCTAssertEqual(GraphTests.tested.edges[0].names, ["HI"], "[HI] -HI-> [HI]")
        XCTAssertEqual(GraphTests.tested.edges[0].target.name, "HI", "[HI] -HI-> [HI]")
        XCTAssertEqual(GraphTests.tested.edges[1].names, ["I"], "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.name, "AL", "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.edges.count, 1, "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.edges[0].names, ["AL?"], "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.edges[0].target.name, "YES", "[HI] -I-> [AL] -AL?-> [YES]")
 
        XCTAssertEqual(GraphTests.tested.edges[2].names, ["AL"], "[HI] -AL-> [YOU] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[2].target.name, "YOU", "[HI] -AL-> [YOU] -AL?-> [YES]")
        
        XCTAssertEqual(GraphTests.tested.edges[3].names, ["YOU"], "[HI] -YOU-> [414C] -414C?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[3].target.name, "414C", "[HI] -AL-> [YOU] -AL?-> [YES]")
        
        XCTAssertEqual(GraphTests.tested.edges[4].names, ["414C"], "[HI] -414C-> [I]")
        XCTAssertEqual(GraphTests.tested.edges[4].target.name, "I", "[HI] -414C-> [I]")
        XCTAssertEqual(GraphTests.tested.edges[4].target.edges.isEmpty, true, "[HI] -414C-> [I]")
    }
}
