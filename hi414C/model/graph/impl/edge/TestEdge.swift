//
//  TestEdge.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.03.2021.
//

import Foundation
import NaturalLanguage

class TestEdge: Edge {
    let id: String
    let names: [String]
    let embeddings: [EmbeddingType]
    let target: Node
    
    convenience init(_ content: () -> Node) {
        self.init([], content)
    }
    
    convenience init (_ name: String, _ content: () -> Node) {
        self.init([name], content)
    }
    
    init(_ names: [String] = [], embeddings: [EmbeddingType] = [], _ content: () -> Node) {
        self.id = UUID().uuidString
        self.names = names
        self.embeddings = embeddings
        self.target = content()
    }
    
    func isTraversable(ctx: GraphContext, toolkit: GraphToolkit) -> Bool {
        let trimmed = ctx.input.trimmingCharacters(in: .whitespacesAndNewlines)
        if self.names.contains(trimmed) {
            return true
        }
        
        let isWord = isWord(trimmed)
        let embeddings = self.embeddings.filter {
            switch $0 {
            case .word(_):
                return isWord
            case .sentence(_):
                return !isWord
            }
        }
        
        for embedding in embeddings {
            let distance = getDistance(between: embedding, and: trimmed)
            if distance < 0.7 {
                return true
            }
        }
            
        return false
    }
    
    func traverse(ctx: GraphContext, toolkit: GraphToolkit) -> Node {
        toolkit.graphVM?.visited.insert(self.id)
        return target
    }
    
    private func isWord(_ text: String) -> Bool {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let spaces = trimmed.filter { $0 == " " }
        return spaces.count < 2
    }
    
    private func getDistance(between first: EmbeddingType, and second: String) -> Double {
        switch first {
        case let .word(word):
            return getWordDistance(between: word, and: second)
        case let .sentence(sentence):
            return getSentenceDistance(between: sentence, and: second)
        }
    }
    
    private func getSentenceDistance(between first: String, and second: String) -> Double {
        if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
            return embedding.distance(between: first, and: second)
        }
        return 0
    }
    
    private func getWordDistance(between first: String, and second: String) -> Double {
        if let embedding = NLEmbedding.wordEmbedding(for: .english) {
            return embedding.distance(between: first, and: second)
        }
        return 0
    }
}

enum EmbeddingType {
    case word(String)
    case sentence(String)
}
