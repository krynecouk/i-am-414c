//
//  TraverseIfEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.06.2021.
//

class TraverseIfEdge: TestEdge {
    let precondition: (GraphContext) -> Bool
    
    init(_ precondition: @escaping (GraphContext) -> Bool, _ content: () -> Node) {
        self.precondition = precondition
        super.init([], content)
    }
    
    override func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        precondition(ctx)
    }
}
