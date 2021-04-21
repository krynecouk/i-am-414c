//
//  FooShake.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 21.04.2021.
//

import SwiftUI

struct FooShake: GeometryEffect {
    var offset: CGFloat
    var pct: CGFloat
    let goingRight: Bool

    init(offset: CGFloat, pct: CGFloat, goingRight: Bool) {
        self.offset = offset
        self.pct = pct
        self.goingRight = goingRight
    }

    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { return AnimatablePair<CGFloat, CGFloat>(offset, pct) }
        set {
            offset = newValue.first
            pct = newValue.second
        }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        var skew: CGFloat

        if pct < 0.2 {
            skew = (pct * 5) * 0.5 * (goingRight ? -1 : 1)
        } else if pct > 0.8 {
            skew = ((1 - pct) * 5) * 0.5 * (goingRight ? -1 : 1)
        } else {
            skew = 0.5 * (goingRight ? -1 : 1)
        }

        return ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: skew, d: 1, tx: offset, ty: 0))
    }
}

extension View {
    func withFoo(offset: CGFloat, pct: CGFloat, goingRight: Bool = true) -> some View {
        self.modifier(FooShake(offset: offset, pct: pct, goingRight: goingRight))
    }
}
