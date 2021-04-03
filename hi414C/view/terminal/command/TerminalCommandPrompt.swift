//
//  TerminalCommandPrompt.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalCommandPrompt: View {
    var theme: TerminalTheme.CommandLine.Prompt
    
    var body: some View {
        FigletView([.greaterThan], theme: theme.figlet)
    }
}

struct TerminalCommandPrompt_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandPrompt(theme: TerminalTheme.CommandLine.Prompt(
            figlet: FigletTheme()
        ))
    }
}
