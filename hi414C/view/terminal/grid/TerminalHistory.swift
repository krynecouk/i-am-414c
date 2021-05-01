//
//  TerminalHistory.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

struct TerminalHistory: View {
    @EnvironmentObject var historyVM: HistoryViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        ForEach(historyVM.history) { message in
            TerminalMessage(message.text, theme: message.author == ._414C ? themeVM.terminal.help.history._414C : themeVM.terminal.help.history.AL)
        }
    }
}
