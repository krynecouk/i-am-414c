//
//  LanguageUtils.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 11.06.2021.
//

import Foundation
import NaturalLanguage

struct LanguageUtils {
    
    public static func isSimilar(_ text: String, to embeddings: [EmbeddingType]) -> Bool {
        let isWord = isWord(text)
        let embeddings = embeddings.filter {
            switch $0 {
            case .word(_):
                return isWord
            case .sentence(_):
                return !isWord
            }
        }
        
        for embedding in embeddings {
            let distance = getDistance(between: embedding, and: text)
            if distance < 0.7 {
                return true
            }
        }
        
        return false
    }
    
    public static func isWord(_ text: String) -> Bool {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let spaces = trimmed.filter { $0 == " " }
        return spaces.count < 2
    }
    
    public static func getDistance(between first: EmbeddingType, and second: String) -> Double {
        switch first {
        case let .word(word):
            return getWordDistance(between: word, and: second)
        case let .sentence(sentence):
            return getSentenceDistance(between: sentence, and: second)
        }
    }
    
    public static func getSentenceDistance(between first: String, and second: String) -> Double {
        if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
            return embedding.distance(between: first, and: second)
        }
        return 100
    }
    
    public static func getWordDistance(between first: String, and second: String) -> Double {
        if let embedding = NLEmbedding.wordEmbedding(for: .english) {
            embedding.enumerateNeighbors(for: first, maximumCount: 5) { neighbor, distance in
                 print("\(neighbor): \(distance.description)")
                 return true
             }

            return embedding.distance(between: first, and: second)
        }
        return 100
    }
    
    public static func lemmatization(text: String) {
        let tagger = NSLinguisticTagger(tagSchemes:[.tokenType, .language, .lexicalClass, .nameType, .lemma], options: 0)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        
        tagger.string = text
        let range = NSRange(location:0, length: text.utf16.count)
        tagger.enumerateTags(in: range, unit: .word, scheme: .lemma, options: options) { tag, tokenRange, stop in
            if let lemma = tag?.rawValue {
                print(lemma)
            }
        }
    }
    
    public static func tokenize(text: String) {
        let tagger = NSLinguisticTagger(tagSchemes:[.tokenType, .language, .lexicalClass, .nameType, .lemma], options: 0)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        
        tagger.string = text
        let range = NSRange(location: 0, length: text.utf16.count)
        tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) { tag, tokenRange, stop in
            let word = (text as NSString).substring(with: tokenRange)
            print(word)
        }
    }
}

enum EmbeddingType {
    case word(String)
    case sentence(String)
}
