//
//  EitherNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 13.06.2021.
//

import Foundation

class EitherNode: Node {
    let id: String
    var name: String
    let edges: [Edge]
    let index: [String:Edge]
    let right: Edge
    let left: Edge
    let predicate: (GraphContext, GraphToolkit) -> Bool
    
    init(left: Edge, right: Edge, _ predicate: @escaping (GraphContext, GraphToolkit) -> Bool) {
        let _edges = [left, right]
        self.id = UUID().uuidString
        self.name = "either_node"
        self.edges = _edges
        self.index = TestNode.index(_edges)
        self.left = left
        self.right = right
        self.predicate = predicate
    }
    
    func onEnter(ctx: GraphContext, toolkit: GraphToolkit) {
        let nextNode = predicate(ctx, toolkit) ? self.right.target : self.left.target
        toolkit.graphVM?.setCurrent(node: nextNode, ctx: ctx, toolkit: toolkit)
    }
}
