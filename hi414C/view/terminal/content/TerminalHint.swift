//
//  TerminalHint.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 05.05.2021.
//

import SwiftUI

struct TerminalHint: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(themeVM.terminal.help.hint.background ?? Color.clear)
                .frame(height: 114)
                .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .identity))
            HStack(spacing: 0) {
                TerminalHintText("Hint: ", theme: themeVM.terminal.help.hint)
                    .padding(.leading, 15)
                TerminalHintScroll(theme: themeVM.terminal.help.hint)
            }
        }
        .transition(AnyTransition.asymmetric(insertion: .move(edge: .bottom), removal: .identity))
    }
}

struct TerminalHintText: View {
    let text: String
    let theme: ViewTheme
    
    init(_ text: String, theme: ViewTheme) {
        self.text = text
        self.theme = theme
    }
    
    var body: some View {
        Text(text)
            .withTheme(theme)
            .padding([.top, .bottom])
            .frame(height: 50)
    }
}

struct TerminalHintScroll: View {
    let theme: ViewTheme
    
    private let hint = "This is help and settings screen. Turn it on with left edge drag. Turn it off with right edge drag."
    
    var body: some View {
        let chars = Array(hint)
        return
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(chars.indices) { i in
                        TerminalHintText(String(chars[i]), theme: theme)
                    }
                }
            }
    }
}
