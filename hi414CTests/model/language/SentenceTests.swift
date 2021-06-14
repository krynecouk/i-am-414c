//
//  SentenceTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 12.06.2021.
//

import XCTest

@testable import hi414C

class SentenceTests: XCTestCase {

    func test_similarity_of_sentences() {
        assertSimilar("HOW ARE YOU DOING?", "HOW ARE YOU")
        
        assertDifferent("HOW ARE YOU", "WHERE IS MY HOME")
    }
    
    func test_tokenization_of_sentences() {
        let tested = "   HELLO, WHAT IS  ,  YOUR NAME? !     "
        XCTAssertEqual(tested.tokenize(), ["HELLO", "WHAT", "IS", "YOUR", "NAME"], "tokenized sentence is different from acceptable result")
    }
    
    func test_lemmatization_of_sentences() {
        let tested = "HELLO, WHAT IS  ,  YOUR NAME? !"
        XCTAssertEqual(tested.lemmatize(), ["hello", "what", "be", "you", "name"], "lemmatized sentence is different from acceptable result")
    }
    
    func assertSimilar(_ first: Sentence, _ second: Sentence) {
        XCTAssertTrue(first.isSimilar(sentence: second, debug: true), "sentence \"\(first)\" should be similar to \"\(second)\"")
    }
    
    func assertDifferent(_ first: Sentence, _ second: Sentence) {
        XCTAssertFalse(first.isSimilar(sentence: second, debug: true), "sentence \"\(first)\" should NOT be similar to \"\(second)\"")
    }

}
