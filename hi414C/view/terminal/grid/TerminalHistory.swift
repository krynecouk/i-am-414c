//
//  TerminalHistory.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

struct TerminalHistory: View {
    @EnvironmentObject var historyVM: HistoryViewModel
    
    var body: some View {
        ForEach(historyVM.history) { message in
            TerminalMessage(message.text, theme: FigletTheme())
        }
    }
}
