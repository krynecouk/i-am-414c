//
//  TestEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import Foundation

typealias EdgeName = String

class TestEdge: Edge {
    let id: String
    let names: [EdgeName]
    let sentences: [Sentence]
    let target: Node
    
    init(id: String = UUID().uuidString, _ names: [String] = [], _ content: () -> Node) {
        self.id = id
        self.names = names
        self.target = content()
        self.sentences = names.filter { !$0.isWord() }
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        if names.contains(ctx.input) {
            return true
        }
        
        if !ctx.input.isWord() {
            for sentence in sentences {
                if sentence.isSimilar(sentence: ctx.input, debug: true) {
                    return true
                }
            }
        }

        return false
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        toolkit.graphVM?.visited.insert(self.id)
        return target
    }
}

extension TestEdge {
    convenience init(_ content: () -> Node) {
        self.init([], content)
    }
    
    convenience init (_ name: String, _ content: () -> Node) {
        self.init([name], content)
    }
}
