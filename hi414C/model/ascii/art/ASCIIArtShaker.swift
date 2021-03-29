//
//  ASCIIArtShaker.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.03.2021.
//

typealias Line = Int
typealias Offset = (x: Float, y: Float)
typealias Shaker = () -> [Line:Offset]

struct ASCIIArtShaker {

    static func of(lines: Int, force: Float = 1, type: ASCIIArtShakeType = .wave) -> Shaker {
        switch type {
        case .wave:
            return waveShake(lines: lines, force: force)
        case .rand:
            return randShake(lines: lines, force: force)
        case .baba:
            return babaShake(lines: lines, force: force)
        }
    }
    
    private static func waveShake(lines: Int, force: Float = 1) -> Shaker {
        var currentLine = 0
        return {
            let offsets = [currentLine:(force * 1, Float(0))]
            currentLine = currentLine == lines - 1
                ? 0
                : currentLine + 1
            return offsets
        }
    }
    
    private static func randShake(lines: Int, force: Float = 1) -> Shaker {
        { [Int.random(in: 0..<lines):(force * 1, Float(0))] }
    }
    
    private static func babaShake(lines: Int, force: Float = 1) -> Shaker {
        return {
            [:]
        }
    }
}

enum ASCIIArtShakeType {
    case wave
    case rand
    case baba
}
