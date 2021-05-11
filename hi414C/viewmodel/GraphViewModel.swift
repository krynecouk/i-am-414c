//
//  GraphViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

import SwiftUI

class GraphViewModel: ObservableObject {
    @Published private(set) var node: Node = Graphs.WHITMAN
    @Published private(set) var result: GraphTraverseResult = .ok
    
    private(set) var graph: Node = Graphs.WHITMAN
    
    let toolkit: GraphToolkit

    init(toolkit: GraphToolkit) {
        self.toolkit = toolkit
        self.toolkit.graphVM = self
        self.start()
    }
    
    func traverse(ctx: GraphContext) {
        let targetNode = traverse(self.node.edges, ctx: ctx) ?? traverse(graph.edges, ctx: ctx)
        if let node = targetNode {
            self.node.onExit(ctx: ctx, toolkit: toolkit)
            self.node = node
            self.node.onEnter(ctx: ctx, toolkit: toolkit)
            self.result = .ok
        } else {
            self.result = .error("Node \(ctx.input) was not found")
        }
    }
    
    private func traverse(_ edges: [Edge], ctx: GraphContext) -> Node? {
        for edge in edges {
            if (edge.isTraversable(ctx: ctx, toolkit: toolkit)) {
                return edge.traverse(ctx: ctx, toolkit: toolkit)
            }
        }
        return .none
    }

    func setGraph(node: Node) {
        self.graph = node
        self.node = node
    }
    
    func start() {
        self.node.onEnter(ctx: GraphContext(input: ""), toolkit: toolkit)
    }
}

enum GraphTraverseResult {
    case ok
    case error(String)
}
