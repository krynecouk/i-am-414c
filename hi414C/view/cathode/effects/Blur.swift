//
//  Blur.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 29.06.2021.
//

import SwiftUI

struct Blur: ViewModifier {
    let active: Bool
    let radius: CGFloat
    
    func body(content: Content) -> some View {
        if active {
            content
                .blur(radius: self.radius)
        } else {
            content
        }
    }
}

extension View {
    func blur(if condition: Bool, radius: CGFloat = 5) -> some View {
        self.modifier(Blur(active: condition, radius: radius))
    }
}
