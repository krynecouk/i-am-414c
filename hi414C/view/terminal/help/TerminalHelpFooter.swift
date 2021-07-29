//
//  TerminalHelpFooter.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.07.2021.
//

import SwiftUI

struct TerminalHelpFooter: View {
    @EnvironmentObject var helpVM: HelpViewModel
    
    var body: some View {
        if helpVM.current == .learn {
            TerminalTestSelect()
        }
        
        if helpVM.current == .settings {
            TerminalSettingsSelect()
        }
    
            TerminalHelpLine()
    }
}
