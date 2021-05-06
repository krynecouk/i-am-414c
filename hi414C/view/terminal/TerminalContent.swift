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
    var messages: Messages?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topLeading) {
                TerminalGrid(items: items)
                if uiVM.isHelp && uiVM.current == .message {
                    TerminalMessages(messages: messages!)
                }
            }
            
            if uiVM.isHelp {
                TerminalHint()
            }
        }
    }
}
