//
//  WordTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 12.06.2021.
//

import XCTest

@testable import hi414C

class WordTests: XCTestCase {

    func test_similarity_of_words() {
        assertSimilar("CAR", "MOTORCYCLE")
        
        assertDifferent("CAR", "HOUSE")
    }
    
    func test_tokenization_of_words() {
        let tested = "   AL? !  "
        XCTAssertEqual(tested.tokenizeWord(), "AL", "tokenized word is different from acceptable result")
    }
    
    func test_lemmatization_of_words() {
        let tested = "MEANING"
        XCTAssertEqual(tested.lemmatizeWord(), "mean", "lemmatized word is different from acceptable result")
    }
    
    func assertSimilar(_ first: Word, _ second: Word) {
        XCTAssertTrue(first.isSimilar(word: second), "word \"\(first)\" should be similar to \"\(second)\"")
    }
    
    func assertDifferent(_ first: Word, _ second: Word) {
        XCTAssertFalse(first.isSimilar(word: second), "word \"\(first)\" should NOT be similar to \"\(second)\"")
    }

}
