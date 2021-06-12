//
//  Word.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.06.2021.
//

import NaturalLanguage

typealias Word = String

extension Word {
    
    func isSimilar(word: String, threshold: Double = 0.9) -> Bool {
        distance(word: word) < threshold
    }
    
    func distance(word: String) -> Double {
        let first = self.lowercased()
        let second = word.lowercased()
        if let embedding = NLEmbedding.wordEmbedding(for: .english) {
            return embedding.distance(between: first, and: second)
        }
        return 2
    }
    
    func neighbors(max: Int = 5) -> [Word] {
        var neighbors: [Word] = []
        if let embedding = NLEmbedding.wordEmbedding(for: .english) {
            embedding.enumerateNeighbors(for: self.lowercased(), maximumCount: max) { neighbor, distance in
                neighbors.append(neighbor)
                return true
            }
        }
        return neighbors
    }
    
    func tokenizeWord() -> Word {
        self.tokenize().joined()
    }
    
    func lemmatizeWord() -> Word {
        self.lemmatize().joined()
    }
    
    func isWord() -> Bool {
         let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
         let spaces = trimmed.filter { $0 == " " }
         return spaces.count == 0
     }
}
