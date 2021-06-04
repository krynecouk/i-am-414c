//
//  ASCIIEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import Foundation

class ASCIITestEdge: Edge {
    let id: String
    let names: [String]
    let target: Node
    
    convenience init(_ content: () -> Node) {
        self.init([], content)
    }
    
    convenience init (_ name: String, _ content: () -> Node) {
        self.init([name], content)
    }
    
    init(_ names: [String] = [], _ content: () -> Node) {
        self.id = UUID().uuidString
        self.names = names
        self.target = content()
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        self.names.contains(ctx.input)
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        toolkit.graphVM?.visited.insert(self.id)
        return target
    }
}
