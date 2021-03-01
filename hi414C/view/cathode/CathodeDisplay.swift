//
//  CathodeBackground.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct CathodeDisplay<Content: View> : View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            //StaticNoise()
            //  .opacity(0.4)
            BlurIn()
                .opacity(0.9)

            Curtain()
                .opacity(0.8)
            content
            RefreshWave()
                .opacity(0.04)
        }
    }
}

struct CathodeDisplay_Previews: PreviewProvider {
    static var previews: some View {
        CathodeDisplay() {
            HStack {
                ANSIShadow.H
                ANSIShadow.E
                ANSIShadow.L
                ANSIShadow.L
                ANSIShadow.O
            }

        }
    }
}
