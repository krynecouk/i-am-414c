//
//  CathodeView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct CathodeView<Content: View>: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Curtain(of: themeVM.terminal.cathode.background)
            if themeVM.terminal.cathode.blurIn != .clear {
                BlurIn(of: themeVM.terminal.cathode.blurIn)
                    .opacity(0.22)
            }
            
            if uiVM.isRefreshWave {
                RefreshWave(of: themeVM.terminal.cathode.wave)
                    .opacity(0.09)
            }
      
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
