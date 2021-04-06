//
//  Shake.swift
//  hi414C
//
//  source: https://www.objc.io/blog/2019/10/01/swiftui-shake-animation/
//
//  Created by Darius Kryszczuk on 06.04.2021.
//

import SwiftUI

struct Shake: GeometryEffect {
    var force: CGFloat = 10
    var shakes = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            force * sin(animatableData * .pi * CGFloat(shakes)),
            y: 0))
    }
}

extension View {
    func withShake(force: CGFloat = 10, amount: Int = 3, attempt: Int) -> some View {
        self.modifier(Shake(force: force, shakes: amount, animatableData: CGFloat(attempt)))
    }
}


