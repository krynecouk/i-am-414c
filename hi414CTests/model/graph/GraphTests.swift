//
//  GraphTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import XCTest

@testable import hi414C

class GraphTests: XCTestCase {
    typealias N = ASCIINode
    typealias E = ASCIIEdge
    
    static let tested: Node =
        N("HI") {
            E("HI") {
                N("HI")
            }
            E("I", variants: ["I?", "ME", "ME?", "WHO AM I", "NAME"]) {
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
        
        XCTAssertEqual(GraphTests.tested.id, "HI", "Root node should have id 'HI'")
        XCTAssertEqual(GraphTests.tested.edges.count, 5, "Root node should have 5 edges")
        XCTAssertEqual(GraphTests.tested.edges[0].id, "HI", "[HI] -HI-> [HI]")
        XCTAssertEqual(GraphTests.tested.edges[0].target.id, "HI", "[HI] -HI-> [HI]")
        XCTAssertEqual(GraphTests.tested.edges[1].id, "I", "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.id, "AL", "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.edges.count, 1, "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.edges[0].id, "AL?", "[HI] -I-> [AL] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[1].target.edges[0].target.id, "YES", "[HI] -I-> [AL] -AL?-> [YES]")
        
        let edgeWithVariants = GraphTests.tested.edges[1]
        XCTAssertEqual(edgeWithVariants.isTraversable(ctx: GraphContext(input: "foo")), false, "Should not be traversable")
        XCTAssertEqual(edgeWithVariants.isTraversable(ctx: GraphContext(input: "I")), true, "Should be traversable")
        XCTAssertEqual(edgeWithVariants.isTraversable(ctx: GraphContext(input: "ME?")), true, "Should be traversable")
        // XCTAssertEqual(edgeWithVariants.isTraversable(ctx: Context(input: "MY NAME")), true, "Should be traversable") //TODO should be traversable
        XCTAssertEqual(edgeWithVariants.traverse().id, "AL", "Should traverse to node with id 'AL'")
        XCTAssertEqual(edgeWithVariants.traverse().edges.count, 1, "New node should have 1 edge to traverse")
        
        XCTAssertEqual(GraphTests.tested.edges[2].id, "AL", "[HI] -AL-> [YOU] -AL?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[2].target.id, "YOU", "[HI] -AL-> [YOU] -AL?-> [YES]")
        
        XCTAssertEqual(GraphTests.tested.edges[3].id, "YOU", "[HI] -YOU-> [414C] -414C?-> [YES]")
        XCTAssertEqual(GraphTests.tested.edges[3].target.id, "414C", "[HI] -AL-> [YOU] -AL?-> [YES]")
        
        XCTAssertEqual(GraphTests.tested.edges[4].id, "414C", "[HI] -414C-> [I]")
        XCTAssertEqual(GraphTests.tested.edges[4].target.id, "I", "[HI] -414C-> [I]")
        XCTAssertEqual(GraphTests.tested.edges[4].target.edges.isEmpty, true, "[HI] -414C-> [I]")
    }
}
