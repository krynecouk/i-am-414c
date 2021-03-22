//
//  GraphViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

import SwiftUI

class GraphViewModel: ObservableObject {
    @Published private(set) var node: Node = Graphs.HI
    
    let toolkit: GraphToolkit

    init(toolkit: GraphToolkit) {
        self.toolkit = toolkit
        self.node.onEnter(ctx: GraphContext(input: ""), toolkit: toolkit)
    }
    
    func process(ctx: GraphContext) {
        self.node.onExit(ctx: ctx, toolkit: toolkit)
        let targetNode = traverse(self.node.edges, ctx: ctx) ?? traverse(Graphs.HI.edges, ctx: ctx)
        if let node = targetNode {
            print("in new node: ", node.id)
            self.node = node
            self.node.onEnter(ctx: ctx, toolkit: toolkit)
        } else {
            print("node not found")
            // TODO what to do when no edge is found?
        }
    }
    
    private func traverse(_ edges: [Edge], ctx: GraphContext) -> Node? {
        for edge in edges {
            if (edge.isTraversable(ctx: ctx)) {
                return edge.traverse()
            }
        }
        return .none
    }
}
