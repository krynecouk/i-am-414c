//
//  CathodeView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct CathodeView<Content: View>: View {
    @EnvironmentObject var themeVM: ThemeViewModel

    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            BlurIn(of: themeVM.terminal.cathode.blurIn)
                .opacity(0.95)
            Curtain(of: themeVM.terminal.cathode.background)
                .opacity(0.8)
            RefreshWave(of: themeVM.terminal.cathode.wave)
                .opacity(0.08)
            content
        }
    }
}

struct CathodeView_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView() {
            HStack {
                FigletView("HELLO")
            }
        }
    }
}
