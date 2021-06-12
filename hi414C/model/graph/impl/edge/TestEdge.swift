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
    let tokens: [String]
    let sentences: [String]
    let target: Node
    
    convenience init(_ content: () -> Node) {
        self.init([], content)
    }
    
    convenience init (_ name: String, silent: [String] = [], _ content: () -> Node) {
        self.init([name], silent: silent, content)
    }
    
    init(_ names: [String] = [], silent: [String] = [], sentences: [String] = [], _ content: () -> Node) {
        self.id = UUID().uuidString
        self.names = names
        self.silent = silent
        self.tokens = (names + silent).map { $0.tokenizeWord() }
        self.sentences = sentences
        self.target = content()
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        let tokenizedInput = ctx.input.tokenizeWord()
        if tokens.contains(tokenizedInput) {
            return true
        }
        
        if ctx.input.isWord() {
            for token in tokens {
                if token.isSimilar(word: tokenizedInput) {
                    return true
                }
            }
        } else {
            for sentence in sentences {
                if sentence.isSimilar(sentence: ctx.input) {
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
