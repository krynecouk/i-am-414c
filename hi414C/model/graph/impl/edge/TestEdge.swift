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
    let embeddings: [EmbeddingType]
    let silent: [String]
    let target: Node
    
    convenience init(_ content: () -> Node) {
        self.init([], content)
    }
    
    convenience init (_ name: String, silent: [String] = [], _ content: () -> Node) {
        self.init([name], silent: silent, content)
    }
    
    init(_ names: [String] = [], silent: [String] = [], embeddings: [EmbeddingType] = [], _ content: () -> Node) {
        self.id = UUID().uuidString
        self.names = names
        self.embeddings = embeddings
        self.silent = silent
        self.target = content()
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        let trimmed = ctx.input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmed.isEmpty {
            return false
        }
        
        if self.names.contains(trimmed) {
            return true
        }
        
        return LanguageUtils.isSimilar(trimmed, to: self.embeddings)
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        toolkit.graphVM?.visited.insert(self.id)
        return target
    }
        

}

