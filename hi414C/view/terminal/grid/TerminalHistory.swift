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
    
    let wide: Bool
    
    var body: some View {
        ForEach(historyVM.history) { message in
            MessageRow(of: message.text, wide: wide) {
                TerminalMessage(message.text, theme: message.author == ._414C ? themeVM.terminal.help.history._414C : themeVM.terminal.help.history.AL)
            }
        }
    }
}
