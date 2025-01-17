//
//  TerminalFooter.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//

import SwiftUI

struct TerminalFooter: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    var body: some View {
        if uiVM.isHelp {
            TerminalHelpFooter()
        } else {
            if !uiVM.detail.is {
                TerminalCommandSegue()
                    .blur(if: !uiVM.isHelpModalClosed)
                    .disabled(!uiVM.isHelpModalClosed)
            } else {
                TerminalHintLine()
            }
        }
    }
}

struct TerminalFooter_Previews: PreviewProvider {
    static var previews: some View {
        TerminalFooter()
    }
}
