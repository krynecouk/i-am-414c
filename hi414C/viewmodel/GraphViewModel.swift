//
//  GraphViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

import SwiftUI

class GraphViewModel: ObservableObject {
    @Published private(set) var node: Node = Graphs.HI
    @Published private(set) var result: GraphTraverseResult = .ok
    
    let toolkit: GraphToolkit

    init(toolkit: GraphToolkit) {
        self.toolkit = toolkit
        self.node.onEnter(ctx: GraphContext(input: ""), toolkit: toolkit)
    }
    
    func traverse(ctx: GraphContext) {
        self.node.onExit(ctx: ctx, toolkit: toolkit)
        let targetNode = traverse(self.node.edges, ctx: ctx) ?? clearAndTraverse(Graphs.HI.edges, ctx: ctx)
        if let node = targetNode {
            self.node = node
            self.node.onEnter(ctx: ctx, toolkit: toolkit)
            self.result = .ok
        } else {
            self.result = .error("Node \(ctx.input) was not found")
        }
    }
    
    private func clearAndTraverse(_ edges: [Edge], ctx: GraphContext) -> Node? {
        let node = traverse(edges, ctx: ctx)
        if node != nil {
            toolkit.historyVM.remove()
        }
        return node
    }
    
    private func traverse(_ edges: [Edge], ctx: GraphContext) -> Node? {
        for edge in edges {
            if (edge.isTraversable(ctx: ctx, toolkit: toolkit)) {
                return edge.traverse(ctx: ctx, toolkit: toolkit)
            }
        }
        return .none
    }
}

enum GraphTraverseResult {
    case ok
    case error(String)
}
