//
//  ASCIIArtShaker.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.03.2021.
//

typealias Line = Int
typealias LineOffset = (x: Float, y: Float)
typealias Shaker = () -> [Line:LineOffset]

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
        let steps = 3
        var currentStep = 0
        let smallOffset = (force * Float.random(in: -1...1), force * Float.random(in: -1...1))
        let biggOffset = (force * Float.random(in: -2...2), force * Float.random(in: -0.5...0.5))
        return {
            var result: [Line:LineOffset] = [:]
            if currentStep == 1 {
                result.updateValue(smallOffset, forKey: Int.random(in: 0...lines/2))
                result.updateValue(biggOffset, forKey: Int.random(in: 0...lines/2))
            }
            if currentStep == 2 {
                result.updateValue(smallOffset, forKey: Int.random(in: lines/2...lines))
                result.updateValue(biggOffset, forKey: Int.random(in: lines/2...lines))
            }
            
            currentStep = currentStep == steps - 1
                ? 0
                : currentStep + 1
            
            return result
        }
    }
}

enum ASCIIArtShakeType {
    case wave
    case rand
    case baba
}
