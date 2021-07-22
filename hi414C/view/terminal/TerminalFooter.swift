//
//  TerminalFooter.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//

import SwiftUI

struct TerminalFooter: View {
    @Namespace private var ns
    @EnvironmentObject var uiVM: UIViewModel
    
    var body: some View {
        if uiVM.isHelp {
            TerminalHelpSegue()
                .matchedGeometryEffect(id: "segue", in: ns)
                .blur(if: uiVM.isHelp && !uiVM.isHelpModalClosed)
                .disabled(uiVM.isHelp && !uiVM.isHelpModalClosed)
        } else {
            if !uiVM.detail.is {
                TerminalCommandSegue()
                    .matchedGeometryEffect(id: "segue", in: ns)
                    .blur(if: !uiVM.isHelpModalClosed)
                    .disabled(!uiVM.isHelpModalClosed)
            }
        }
    }
}

struct TerminalFooter_Previews: PreviewProvider {
    static var previews: some View {
        TerminalFooter()
    }
}
