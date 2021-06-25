//
//  ArtTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.03.2021.
//

import SwiftUI

struct FigletTheme {
    var typeface: FigletTypeface = .ansi()
    var view: ViewTheme = ViewTheme()
    var animations: [ArtAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, type: .wave)]
}

struct LiteFigletTheme {
    var typeface: FigletTypeface = .ansi()
    var view: ViewTheme = ViewTheme()
}

extension LiteFigletTheme {
    static func from(_ theme: FigletTheme) -> LiteFigletTheme {
        LiteFigletTheme(typeface: theme.typeface, view: theme.view)
    }
}

extension FigletTheme {
    func withDelay(_ delay: Double) -> FigletTheme {
        var copy = self
        copy.animations = add(delay: delay, to: copy.animations)
        return copy
    }
    
    func withAnimation(_ animations: [ArtAnimation]) -> FigletTheme {
        var copy = self
        copy.animations = animations
        return copy
    }
}

struct ArtTheme {
    var view: ViewTheme = ViewTheme()
    var animations: [ArtAnimation] = [.print(dt: 0.3), .shake(dt: 0.8, force: 1, type: .wave)]
}

enum ArtAnimation {
    case print(dt: Double = 0.3, delay: Double = 0, animation: Animation? = .linear)
    case shake(dt: Double = 0.8, force: Float = 1, type: ASCIIArtShakeType = .wave, animation: Animation? = .none)
    case bloom(speed: Double = 0.8, color: Color = .primary)
}

extension ArtTheme {
    func withDelay(_ delay: Double) -> ArtTheme {
        var copy = self
        copy.animations = add(delay: delay, to: copy.animations)
        return copy
    }
    
    func withAnimation(_ animations: [ArtAnimation]) -> ArtTheme {
        var copy = self
        copy.animations = animations
        return copy
    }
}

private func add(delay: Double, to animations: [ArtAnimation]) -> [ArtAnimation] {
    var result: [ArtAnimation] = []
    for animation in animations {
        if case let .print(dt, _, animation) = animation {
            result.append(ArtAnimation.print(dt: dt, delay: delay, animation: animation))
        } else {
            result.append(animation)
        }
    }
    return result
}
