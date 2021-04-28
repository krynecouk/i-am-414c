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
                    .onChanged({ gesture in
                        if slope(gesture) < 1 {
                            if gesture.startLocation.x < CGFloat(40) {
                                left()
                            }
                            if gesture.startLocation.x > CGFloat(UIScreen.main.bounds.width - 40) {
                                right()
                            }
                        }
                    })
            )
    }
    
    func slope(_ gesture: DragGesture.Value) -> CGFloat {
        abs((gesture.startLocation.y - gesture.location.y)/(gesture.startLocation.x - gesture.location.x))
    }
}

extension View {
    func onEdgeDrag(left: @escaping () -> Void = {}, right: @escaping () -> Void = {}) -> some View {
        self.modifier(EdgeDrag(left: left, right: right))
    }
}
