//
//  TestEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import Foundation

class TestEdge: Edge {
    let id: String
    let names: [String]
    let silent: [String]
    let target: Node
    
    convenience init(silent: [String] = [], _ content: () -> Node) {
        self.init([], silent: silent, content)
    }
    
    convenience init (_ name: String, silent: [String] = [], _ content: () -> Node) {
        self.init([name], silent: silent, content)
    }
    
    init(_ names: [String] = [], silent: [String] = [], _ content: () -> Node) {
        self.id = UUID().uuidString
        self.names = names
        self.silent = silent
        self.target = content()
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        (self.names + self.silent).contains(ctx.input)
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        toolkit.graphVM?.visited.insert(self.id)
        return target
    }
}
