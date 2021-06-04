//
//  GraphViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

import SwiftUI
import OrderedCollections

class GraphViewModel: ObservableObject, Resetable {
    @Published private(set) var result: GraphTraverseResult = .ok
    @Published private(set) var root: Node = Graphs.BIN
    
    typealias EdgeId = String
    
    var current: Node = Graphs.BIN
    var visited: Set<EdgeId> = []
    let toolkit: GraphToolkit
    
    init(graph: GraphType = .BIN, toolkit: GraphToolkit) {
        self.toolkit = toolkit
        self.toolkit.graphVM = self
        self.setGraph(GraphDao.find() ?? graph)
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
    
    func setGraph(_ type: GraphType) {
        let graph = type.toGraph()
        self.root = graph
        self.current = graph
        self.start()
        GraphDao.store(type)
    }
    
    func reset() {
        self.setGraph(.BIN)
    }
    
    private func start() {
        self.current.onEnter(ctx: GraphContext(input: ""), toolkit: toolkit)
    }
    
    func generateTests(for text: String) {
        let symbols = text.map { char in
            ASCIISymbol.from(String(char))
        }
        generateTests(for: symbols)
    }
    
    func generateTests(for symbols: [ASCIISymbol]) {
        let tests: [Test] = symbols.map { toolkit.testVM.generate(for: $0) }
        toolkit.terminalVM.setContent([.test(tests)])
    }
    
    func getReplies(ascii: Set<ASCIISymbol>) -> OrderedSet<String> {
        let precondition: (String) -> Bool = { path in
            ascii.contains(all: path.map { ASCIISymbol.from($0) })
        }
        var current = getPaths(from: current, precondition: precondition)
        let root = getPaths(from: root, precondition: precondition, visitedLast: true)
        current.append(contentsOf: root)
        return current
    }
    
    private func getPaths(from node: Node, precondition: (String) -> Bool, visitedLast: Bool = false) -> OrderedSet<String> {
        var paths: OrderedSet<String> = []
        var visited: OrderedSet<String> = []
        for edge in node.edges {
            edge.names.forEach { name in
                if precondition(name) {
                    if visitedLast {
                        if self.visited.contains(edge.id) {
                            visited.append(name)
                        } else {
                            paths.append(name)
                        }
                    } else {
                        paths.append(name)
                    }
                }
            }
        }
        paths.append(contentsOf: visited)
        return paths
    }
}

enum GraphType: String, Storable {
    case BIN, HEX
    
    func toGraph() -> Node {
        switch self {
        case .BIN:
            return Graphs.BIN
        case .HEX:
            return Graphs.HEX
        }
    }
}

enum GraphTraverseResult {
    case ok
    case error(String)
}
