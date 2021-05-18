//
//  EdgeGesture.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

struct EdgeDrag: ViewModifier {
    let left: () -> Void
    let right: () -> Void
    
    func body(content: Content) -> some View {
        content
            .gesture(
                DragGesture()
                    .onEnded { gesture in
                        let direction = getDirection(from: gesture)
                        if direction == .left {
                            left()
                        }
                        if direction == .right {
                            right()
                        }
                    }
            )
    }
    
    enum Direction: String {
        case left, right, none
    }
    
    func getDirection(from value: DragGesture.Value) -> Direction {
        let minDistance: CGFloat = 34
        if value.startLocation.x < value.location.x - minDistance {
            return .left
        }
        if value.startLocation.x > value.location.x + minDistance {
            return .right
        }
        return .none
    }
}

extension View {
    func onEdgeDrag(left: @escaping () -> Void = {}, right: @escaping () -> Void = {}) -> some View {
        self.modifier(EdgeDrag(left: left, right: right))
    }
}
