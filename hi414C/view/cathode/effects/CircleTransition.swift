//
//  CircleTransition.swift
//  hi414C
//
//  source: https://swiftui-lab.com/advanced-transitions/
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

struct ShapeClipModifier<S: Shape>: ViewModifier {
    let shape: S
    
    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

struct CircleClipShape: Shape {
    var pct: CGFloat
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var bigRect = rect
        bigRect.size.width = bigRect.size.width * 2 * (1 - pct)
        bigRect.size.height = bigRect.size.height * 2 * (1 - pct)
        bigRect = bigRect.offsetBy(dx: -rect.width/2.0, dy: -rect.height/2.0)
        
        path = Circle().path(in: bigRect)
        
        return path
    }
}

extension AnyTransition {
    static var circular: AnyTransition { get {
        AnyTransition.modifier(
            active: ShapeClipModifier(shape: CircleClipShape(pct: 1)),
            identity: ShapeClipModifier(shape: CircleClipShape(pct: 0)))
    }}
}
