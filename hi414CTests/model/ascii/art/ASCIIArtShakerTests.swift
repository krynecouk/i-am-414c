//
//  ASCIIArtShakerTests.swift
//  hi414CTests
//
//  Created by Darius Kryszczuk on 23.03.2021.
//

import XCTest

@testable import hi414C

class ASCIIArtShakerTests: XCTestCase {
    
    func test_of_ASCII_art_wave_shaker() {
        let shakeMoves = ASCIIArtShaker.shake(lines: 5, force: 1.5, type: .wave)
        
        XCTAssertEqual(shakeMoves[0][0], 1.5, "[0: 1.5, 1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0]")
        XCTAssertEqual(shakeMoves[0][1], 0, "[0: 0.0, 1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0]")
        XCTAssertEqual(shakeMoves[0][2], 0, "[0: 0.0, 1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0]")
        XCTAssertEqual(shakeMoves[0][3], 0, "[0: 0.0, 1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0]")
        XCTAssertEqual(shakeMoves[0][4], 0, "[0: .00, 1: 0.0, 2: 0.0, 3: 0.0, 4: 0.0]")
        XCTAssertEqual(shakeMoves[1][1], 1.5, "[0: 0.0, 1: 1.5, 2: 0.0, 3: 0.0, 4: 0.0]")
        XCTAssertEqual(shakeMoves[2][2], 1.5, "[0: 0.0, 1: 0.0, 2: 1.5, 3: 0.0, 4: 0.0]")
        XCTAssertEqual(shakeMoves[3][3], 1.5, "[0: 0.0, 1: 0.0, 2: 0.0, 3: 1.5, 4: 0.0]")
        XCTAssertEqual(shakeMoves[4][4], 1.5, "[0: 0.0, 1: 0.0, 2: 0.0, 3: 0.0, 4: 1.5]")
        
        print("shake moves: ", shakeMoves)
    }
}
