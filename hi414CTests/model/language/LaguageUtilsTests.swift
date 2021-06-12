//
//  LaguageUtilsTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 11.06.2021.
//

import XCTest

@testable import hi414C

class LaguageUtilsTests: XCTestCase {

    func test_of_similarity() {
        print(LanguageUtils.getDistance(between: .sentence("WHY ARE WE TALKING?"), and: "WHY YOU ARE TALKING TO ME?"))
    }
    
    func test_of_lemmas() {
        let words: [String] = "HELLO MY NAME, and you IS PEDRO!".tokenize()
        print(words)
    }
    
    func test_of_tokens() {
        print("WHO ARE YOU?".isSimilar(sentence: "WHERE IS MY HOME?"))
    }

}
