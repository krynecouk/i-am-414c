//
//  GraphViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

import SwiftUI

class GraphViewModel: ObservableObject {
    @Published private(set) var result: GraphTraverseResult = .ok
    @Published private(set) var root: Node = Graphs.HI
    
    private var current: Node = Graphs.HI
    private let toolkit: GraphToolkit

    init(toolkit: GraphToolkit) {
        self.toolkit = toolkit
        self.toolkit.graphVM = self
        self.start()
    }
    
    func traverse(ctx: GraphContext) {
        let targetNode = traverse(self.current.edges, ctx: ctx) ?? traverse(root.edges, ctx: ctx)
        if let node = targetNode {
            self.current.onExit(ctx: ctx, toolkit: toolkit)
            self.current = node
            self.current.onEnter(ctx: ctx, toolkit: toolkit)
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

    func setGraph(root: Node) {
        self.root = root
        self.current = root
        self.start()
    }
    
    private func start() {
        self.current.onEnter(ctx: GraphContext(input: ""), toolkit: toolkit)
    }
    
    func getAnswers(ascii: Set<ASCIISymbol>) -> [String] {
        let precondition: (String) -> Bool = { path in
            ascii.contains(all: path.map { ASCIISymbol.from($0) })
        }
        let current = getPaths(from: current, precondition: precondition)
        let root = getPaths(from: root, precondition: precondition)
        let result = Array(current) + Array(root)
        return result
    }
    
    func getPaths(from node: Node, precondition: (String) -> Bool) -> Set<String> {
        var paths: Set<String> = []
        for edge in node.edges {
            if precondition(edge.id) {
                paths.insert(edge.id)
            }
            if let asciiEdge = edge as? ASCIITestEdge {
                asciiEdge.variants.forEach { variant in
                    if precondition(variant) {
                        paths.insert(variant)
                    }
                }
            }
        }
        return paths
    }
}

enum GraphType {
    case HI, HI2, WHITMAN
}

enum GraphTraverseResult {
    case ok
    case error(String)
}
