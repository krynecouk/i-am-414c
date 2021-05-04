//
//  Bloom.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.03.2021.
//

import SwiftUI

struct Bloom: ViewModifier {
    let color: Color
    let active: Bool
    
    func body(content: Content) -> some View {
        if active {
            content
                .shadow(color: self.color, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        } else {
            content
        }
    }
}

extension View {
    func bloom(color: Color = .primary, active: Bool = true) -> some View {
        self.modifier(Bloom(color: color, active: active))
    }
}
