//
//  TerminalCommandLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalCommandLine: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 0) {
                TerminalCommandPrompt(theme: themeVM.terminal.commandLine.prompt)
                .padding(.trailing, 17)
                ForEach(Array(keyboardVM.input.enumerated()), id: \.offset) { i, char in
                    Text(String(char))
                        .offset(y: 4)
                        .withTheme(themeVM.terminal.commandLine.text.view)
                        .bloomFadeOut(speed: themeVM.terminal.commandLine.text.bloom.speed, color: themeVM.terminal.commandLine.text.bloom.color)
                        .padding(.trailing, 4)
                    
                }
                TerminalCommandCursor(theme: themeVM.terminal.commandLine.cursor)
                    .id(keyboardVM.input)
            }
            .padding(.all, 15)
        }
        .frame(height: 64)
        .background(themeVM.terminal.commandLine.view.background.edgesIgnoringSafeArea(.all))
    }
}

struct TerminalCommandLine_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandLine()
            .withEnvironment()
    }
}
