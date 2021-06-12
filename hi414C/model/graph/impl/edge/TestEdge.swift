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
    let hidden: [EdgeName]
    let context: [Sentence]
    let tokens: [EdgeName]
    let target: Node
    
    init(_ names: [String] = [], hidden: [String] = [], ctx context: [Sentence] = [], _ content: () -> Node) {
        self.id = UUID().uuidString
        self.names = names
        self.hidden = hidden
        self.context = context
        self.target = content()
        self.tokens = (names + `hidden`).map { $0.tokenizeWord() }
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
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

        return false
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        toolkit.graphVM?.visited.insert(self.id)
        return target
    }
}

extension TestEdge {
    convenience init(_ content: () -> Node) {
        self.init([], hidden: [], ctx: [], content)
    }
    
    convenience init(ctx: String, _ content: () -> Node) {
        self.init([], hidden: [], ctx: [ctx], content)
    }
    
    convenience init (_ name: String, hidden: [String] = [], _ content: () -> Node) {
        self.init([name], hidden: hidden, ctx: [], content)
    }
    
    convenience init (_ name: String, hidden: [String] = [], ctx: String, _ content: () -> Node) {
        self.init([name], hidden: hidden, ctx: [ctx], content)
    }
    
    convenience init (_ name: String, hidden: [String] = [], ctx: [String] = [], _ content: () -> Node) {
        self.init([name], hidden: hidden, ctx: ctx, content)
    }
    
    convenience init (_ names: [String] = [], hidden: [String] = [], ctx: String, _ content: () -> Node) {
        self.init(names, hidden: hidden, ctx: [ctx], content)
    }
}
