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
            if message.author == ._414C {
                TerminalMessage(message.text, theme: themeVM.terminal.help.history._414C)
            } else {
                Text(message.text)
                    .withTheme(themeVM.terminal.help.history.AL)
            }
        }
    }
}
