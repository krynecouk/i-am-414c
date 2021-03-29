//
//  ASCIIArtSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct FigletSettings {
    var typeface: FigletTypeface = .ansi()
    var view: ViewSettings = ViewSettings()
    var animations: [ASCIIArtAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, animation: .wave)]
}

extension FigletSettings {
    func withDelay(_ delay: Double) -> FigletSettings {
        var copy = self
        copy.animations = add(delay: delay, to: copy.animations)
        return copy
    }
}

func add(delay: Double, to animations: [ASCIIArtAnimation]) -> [ASCIIArtAnimation] {
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

struct ASCIIArtSettings {
    var view: ViewSettings = ViewSettings()
    var animations: [ASCIIArtAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, animation: .wave)]
}

enum ASCIIArtAnimation {
    case print(dt: Double = 0.3, delay: Double = 0, animation: Animation? = .linear)
    case shake(dt: Double = 0.4, force: Float = 0.8, animation: ASCIIArtShakeType = .wave)
}

extension ASCIIArtSettings {
    func withDelay(_ delay: Double) -> ASCIIArtSettings {
        var copy = self
        copy.animations = add(delay: delay, to: copy.animations)
        return copy
    }
}
