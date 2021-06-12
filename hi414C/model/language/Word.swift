//
//  Word.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.06.2021.
//

import NaturalLanguage

typealias Word = String

extension Word {
    
    func isSimilar(word: String, threshold: Double = 0.7) -> Bool {
        distance(word: word) < threshold
    }
    
    func distance(word: String) -> Double {
        if let embedding = NLEmbedding.wordEmbedding(for: .english) {
            return embedding.distance(between: self, and: word)
        }
        return 2
    }
    
    func neighbors(max: Int = 5) -> [Word] {
        var neighbors: [Word] = []
        if let embedding = NLEmbedding.wordEmbedding(for: .english) {
            embedding.enumerateNeighbors(for: self, maximumCount: max) { neighbor, distance in
                neighbors.append(neighbor)
                return true
            }
        }
        return neighbors
    }
    
    func tokenize() -> Word {
        self.tokenize().joined()
    }
}
