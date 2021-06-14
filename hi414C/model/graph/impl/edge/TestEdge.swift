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
    let target: Node
    
    init(id: String = UUID().uuidString, _ names: [String] = [], _ content: () -> Node) {
        self.id = id
        self.names = names
        self.target = content()
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        /*
        let tokenizedInput = ctx.input.tokenizeWord()
        if tokens.contains(tokenizedInput) {
            return true
        }
        
        if ctx.input.isWord() {
            for token in tokens {
                if token.isSimilar(word: tokenizedInput) {
                    print("SIMILAR WITH DISTANCE:", token.distance(word: ctx.input))
                    return true
                }
            }
        } else {
            for sentence in context {
                if sentence.isSimilar(sentence: ctx.input) {
                    print("SIMILAR WITH DISTANCE:", sentence.distance(sentence: ctx.input))
                    return true
                }
            }
        }
        */

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
