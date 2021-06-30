//
//  FigletTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct FigletTheme {
    var typeface: FigletTypeface = .ansi()
    var view: ViewTheme = ViewTheme()
    var animations: [FigletAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, type: .wave)]
}

extension FigletTheme {
    func withDelay(_ delay: Double) -> FigletTheme {
        var copy = self
        copy.animations = add(delay: delay, to: copy.animations)
        return copy
    }
    
    func withAnimation(_ animations: [FigletAnimation]) -> FigletTheme {
        var copy = self
        copy.animations = animations
        return copy
    }
}

enum FigletAnimation {
    case print(dt: Double = 0.3, delay: Double = 0, animation: Animation? = .linear)
    case shake(dt: Double = 0.8, force: Float = 1, type: FigletShakeType = .wave, animation: Animation? = .none)
    case bloom(speed: Double = 0.8, color: Color = .primary)
}

private func add(delay: Double, to animations: [FigletAnimation]) -> [FigletAnimation] {
    var result: [FigletAnimation] = []
    for animation in animations {
        if case let .print(dt, _, animation) = animation {
            result.append(FigletAnimation.print(dt: dt, delay: delay, animation: animation))
        } else {
            result.append(animation)
        }
    }
    return result
}
