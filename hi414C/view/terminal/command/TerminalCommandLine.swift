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
                TerminalCommandPrompt(theme: themeVM.terminal.cli.prompt)
                .padding(.trailing, 17)
                ForEach(Array(keyboardVM.input.enumerated()), id: \.offset) { i, char in
                    Text(String(char))
                        .offset(y: 4)
                        .withTheme(themeVM.terminal.cli.text.view)
                        .bloomFadeOut(speed: themeVM.terminal.cli.text.bloom.speed, color: themeVM.terminal.cli.text.bloom.color)
                        .padding(.trailing, 4)
                    
                }
                TerminalCommandCursor(theme: themeVM.terminal.cli.cursor)
                    .id(keyboardVM.input)
            }
            .padding(.all, 15)
        }
        .frame(height: 64)
        .background(themeVM.terminal.cli.view.background.edgesIgnoringSafeArea(.all))
    }
}

struct TerminalCommandLine_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandLine()
            .withEnvironment()
    }
}
