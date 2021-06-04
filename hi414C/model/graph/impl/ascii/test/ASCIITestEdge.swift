//
//  ASCIIEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import Foundation

class ASCIITestEdge: Edge {
    let id: String
    let msg: String
    var variants: [String]
    let target: Node
    
    init(_ msg: String, _ variants: [String] = [], _ content: () -> Node) {
        self.id = UUID().uuidString
        self.msg = msg
        self.variants = variants
        self.target = content()
        self.variants.append(msg)
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        self.variants.contains(ctx.input)
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        toolkit.graphVM?.visited.insert(self.id)
        return target
    }
}

class TraverseAllEdge: TraverseIfEdge {
    init(_ msg: String, _ content: () -> Node) {
        super.init(msg, if: { _ in true }, content)
    }
}

class TraverseIfEdge: ASCIITestEdge {
    let precondition: (GraphContext) -> Bool
    
    init(_ msg: String, if precondition: @escaping (GraphContext) -> Bool, _ content: () -> Node) {
        self.precondition = precondition
        super.init(msg, [], content)
    }
    
    override func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        precondition(ctx)
    }
}
