//
//  ASCIIArtShaker.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.03.2021.
//

typealias LineIdx = Int
typealias LineOffset = Float
typealias ShakeMove = [LineIdx:LineOffset]

struct ASCIIArtShaker {

    static func shake(lines: Int, force: Float = 1, type: ASCIIArtShakeType = .wave) -> [ShakeMove] {
        switch type {
        case .wave:
            return waveShake(lines: lines, force: force)
        case .rand:
            return randShake(lines: lines, force: force)
        case .baba:
            return babaShake(lines: lines, force: force)
        }
    }
    
    static func waveShake(lines: Int, force: Float = 1) -> [ShakeMove] {
        var moves: [ShakeMove] = []
        for i in 0..<lines {
            var move: ShakeMove = [:]
            for j in 0..<lines {
                if i == j {
                    move[j] = force * 1
                } else {
                    move[j] = 0
                }
            }
            moves.append(move)
        }
        return moves
    }
    
    static func randShake(lines: Int, force: Float = 1) -> [ShakeMove] {
        let moves: [ShakeMove] = [
            [Int.random(in: 0..<lines):force * 1]
        ]
        return moves
        
    }
    
    static func babaShake(lines: Int, force: Float = 1) -> [ShakeMove] {
        [[:]]
    }
}

enum ASCIIArtShakeType {
    case wave
    case rand
    case baba
}
