//
//  Sentence.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 12.06.2021.
//

import NaturalLanguage

typealias Sentence = String

extension Sentence {
    
    func isSimilar(sentence: String, threshold: Double = 0.58, debug: Bool = false) -> Bool {
        let distance = distance(sentence: sentence)
        if debug {
            print("distance of \"\(self)\" and \(sentence) is: \(distance)")
        }
        return distance < threshold
    }
    
    func distance(sentence: String) -> Double {
        if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
            return embedding.distance(between: self, and: sentence)
        }
        return 2
    }
    
    func tokenize() -> [String] {
        var result: [String] = []
        let tagger = NSLinguisticTagger(tagSchemes:[.tokenType], options: 0)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        let toTokenize = self
        
        tagger.string = toTokenize
        let range = NSRange(location: 0, length: toTokenize.utf16.count)
        tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) { tag, tokenRange, stop in
            let word = (toTokenize as NSString).substring(with: tokenRange)
            result.append(word)
        }
        return result
    }
    
    func lemmatize() -> [String] {
        var result: [String] = []
        let tagger = NSLinguisticTagger(tagSchemes:[.tokenType, .language, .lexicalClass, .nameType, .lemma], options: 0)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        let toLemmatize = self.lowercased()
        
        tagger.string = toLemmatize
        let range = NSRange(location:0, length: toLemmatize.utf16.count)
        tagger.enumerateTags(in: range, unit: .word, scheme: .lemma, options: options) { tag, tokenRange, stop in
            if let lemma = tag?.rawValue {
                result.append(lemma)
            }
        }
        return result
    }
}
