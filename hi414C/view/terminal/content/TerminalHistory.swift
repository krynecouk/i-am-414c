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
                if message.author == ._414C {
                    TerminalMessage(message.text, theme: themeVM.terminal.help.history._414C)
                } else {
                    TerminalAlMessage(message.text, theme: themeVM.terminal.help.history.AL)
                }
            }
        }
    }
}
