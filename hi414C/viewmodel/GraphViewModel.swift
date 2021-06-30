//
//  GraphViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.03.2021.
//

import SwiftUI
import OrderedCollections

class GraphViewModel: ObservableObject, Resetable {
    @Published private(set) var root: Node = Graphs.BIN
    
    typealias EdgeId = String
    
    private(set) var current: Node = Graphs.BIN
    private(set) var toolkit: GraphToolkit

    var visited: Set<EdgeId> = []
    
    init(graph: GraphType = .BIN, toolkit: GraphToolkit) {
        self.toolkit = toolkit
        self.toolkit.graphVM = self
        self.setGraph(GraphDao.find() ?? graph)
        self.start()
        print(root.index)
    }
    
    func traverse(ctx: GraphContext, _ callback: @escaping (GraphTraverseResult) -> Void = { _ in }) {
        DispatchQueue.global().async {
            let targetNode = self.traverse(node: self.current, ctx: ctx)
                ?? (self.current is RootNode ? .none : self.traverse(node: self.root, ctx: ctx))
            self.setCurrent(node: targetNode, ctx: ctx, toolkit: self.toolkit, callback)
        }
    }
    
    func setCurrent(node: Node?, ctx: GraphContext, toolkit: GraphToolkit, _ callback: @escaping (GraphTraverseResult) -> Void = { _ in }) {
        DispatchQueue.main.async {
            if let node = node {
                self.current.onExit(ctx: ctx, toolkit: toolkit)
                self.current = node
                self.current.onEnter(ctx: ctx, toolkit: toolkit)
                callback(.ok)
            } else {
                callback(.error("Node \(ctx.input) was not found"))
            }
        }
    }
    
    private func traverse(node: Node, ctx: GraphContext) -> Node? {
        if let indexed = node.find(name: ctx.input) {
            print("found \(indexed.names)")
            return indexed.traverse(ctx: ctx, toolkit: toolkit)
        }
        print("not found, looping node id \(node.name)")
        return traverse(edges: node.edges, ctx: ctx)
    }
    
    private func traverse(edges: [Edge], ctx: GraphContext) -> Node? {
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
        self.visited = []
        self.setGraph(.BIN)
    }
    
    private func start() {
        self.current.onEnter(ctx: GraphContext(input: ""), toolkit: toolkit)
    }
    
    func generateTests() {
        generateTests(for: current.name)
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
    
    func getReplies(ascii: Set<ASCIISymbol>) -> (current: Set<String>, root: Set<String>) {
        let currentRule: (String) -> Bool = { path in
            ascii.contains(all: path.map { ASCIISymbol.from($0) })
        }
        let current = self.current is RootNode ? ["HI"] : getPaths(from: current, precondition: currentRule)
        
        let rootRule: (String) -> Bool = { path in
            ascii.contains(all: path.map { ASCIISymbol.from($0) }) && !current.contains(path)
        }
        let root = getPaths(from: root, precondition: rootRule, visitedLast: true)
        return (current, root)
    }
    
    private func getPaths(from node: Node, precondition: (String) -> Bool, visitedLast: Bool = false) -> Set<String> {
        print("GETTING PATHS FROM \(node.name)")
        var paths: Set<String> = []
        //var visited: Set<String> = []
        for edge in node.edges {
            for name in edge.names.reversed() {
                if precondition(name) {

                        paths.insert(name)
                    break // store only first acceptable reply
                }
            }
        }
        //paths.append(contentsOf: visited)
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
