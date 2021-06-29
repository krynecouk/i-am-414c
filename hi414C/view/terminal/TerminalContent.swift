//
//  TerminalContent.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 05.05.2021.
//

import SwiftUI

struct TerminalContent: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    var items: [TerminalItem]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .center) {
                let isHelpModal = uiVM.isHelp && !uiVM.isHelpModalClosed
                TerminalGrid(items: items)
                    .blur(if: isHelpModal)
                if uiVM.isHelp {
                    TerminalHelpMessages()
                        .blur(if: isHelpModal)
                    TerminalHelpSettings()
                        .blur(if: isHelpModal)
                    if !uiVM.isHelpModalClosed {
                        HelpModal()
                    }
                }
            }
        }
    }
}
