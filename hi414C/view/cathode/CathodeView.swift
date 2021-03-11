//
//  CathodeView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct CathodeView<Content: View> : View {
    
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

struct CathodeView_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView() {
            HStack {
                FigletView(ANSIShadow.H)
                FigletView(ANSIShadow.E)
                FigletView(ANSIShadow.L)
                FigletView(ANSIShadow.L)
                FigletView(ANSIShadow.O)
            }

        }
    }
}