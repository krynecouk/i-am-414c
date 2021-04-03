//
//  BloomFadeOut.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 02.04.2021.
//

import SwiftUI

struct BloomFadeOut: ViewModifier {
    @State var opacity: Double = 1
    
    var color: Color
    var speed: Double
    
    func body(content: Content) -> some View {
        content
            .background(color.opacity(opacity).bloom())
            .onAppear {
                withAnimation(Animation.easeIn.speed(speed)) {
                    self.opacity = 0
                }
            }
    }
}

extension View {
    func bloomFadeOut(color: Color = Color("Primary"), speed: Double = 0.8) -> some View {
        self.modifier(BloomFadeOut(color: color, speed: speed))
    }
}