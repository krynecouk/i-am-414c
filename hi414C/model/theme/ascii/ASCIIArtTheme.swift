//
//  ASCIIArtTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct FigletTheme {
    var typeface: FigletTypeface = .ansi()
    var view: ViewTheme = ViewTheme()
    var animations: [ASCIIArtAnimation] = [.print(dt: 0.3), .bloom(speed: 0.8, color: .primary)]
}

extension FigletTheme {
    func withDelay(_ delay: Double) -> FigletTheme {
        var copy = self
        copy.animations = add(delay: delay, to: copy.animations)
        return copy
    }
}

struct ASCIIArtTheme {
    var view: ViewTheme = ViewTheme()
    var animations: [ASCIIArtAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, type: .wave)]
}

enum ASCIIArtAnimation {
    case print(dt: Double = 0.3, delay: Double = 0, animation: Animation? = .linear)
    case shake(dt: Double = 0.4, force: Float = 0.8, type: ASCIIArtShakeType = .wave, animation: Animation? = .none)
    case bloom(speed: Double = 0.8, color: Color = .primary)
}

extension ASCIIArtTheme {
    func withDelay(_ delay: Double) -> ASCIIArtTheme {
        var copy = self
        copy.animations = add(delay: delay, to: copy.animations)
        return copy
    }
}

private func add(delay: Double, to animations: [ASCIIArtAnimation]) -> [ASCIIArtAnimation] {
    var result: [ASCIIArtAnimation] = []
    for animation in animations {
        if case let .print(dt, _, animation) = animation {
            result.append(ASCIIArtAnimation.print(dt: dt, delay: delay, animation: animation))
        } else {
            result.append(animation)
        }
    }
    return result
}
