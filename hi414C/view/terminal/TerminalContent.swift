//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 26.04.2021.
//

import SwiftUI

struct TerminalContent: View {
    @EnvironmentObject var uiVM: UIViewModel

    var items: [TerminalItem]
    
    init(items: [TerminalItem]) {
        print("TerminalContent")
        self.items = items
    }
    
    var body: some View {
        if uiVM.isHelp {
            TerminalHelp(items: items)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .transition(.iris)
        } else {
            TerminalGrid(items: items)
        }
    }
}

extension AnyTransition {
    static var circular: AnyTransition { get {
        AnyTransition.modifier(
            active: ShapeClipModifier(shape: CircleClipShape(pct: 1)),
            identity: ShapeClipModifier(shape: CircleClipShape(pct: 0)))
        }
    }
}

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

struct ScaledCircle: Shape {
    // This controls the size of the circle inside the
    // drawing rectangle. When it's 0 the circle is
    // invisible, and when it’s 1 the circle fills
    // the rectangle.
    var animatableData: CGFloat

    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2

        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)

        return Circle().path(in: circleRect)
    }
}

// A general modifier that can clip any view using a any shape.
struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

// A custom transition combining ScaledCircle and ClipShapeModifier.
extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}
