//
//  TerminalMessageRow.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

struct TerminalMessageRow: View {
    let text: String
    let theme: FigletTheme
    let wide: Bool
    let words: [Substring]
    
    init(_ text: String, wide: Bool, theme: FigletTheme) {
        self.text = text
        self.wide = wide
        self.theme = theme
        self.words = text.split(separator: " ")
    }
    
    var body: some View {
        if wide {
            TerminalMessage(self.text, theme: theme)
        } else {
            ForEach(self.words.map { Item($0) }) { item in
                MessageRow(of: item.content, wide: wide) {
                    TerminalMessage(item.content, theme: theme)
                }
            }
        }

    }
}

struct TerminalMessage: View {
    let text: String
    let theme: FigletTheme
    
    init(_ text: String, theme: FigletTheme) {
        print("TerminalMessage")
        self.text = text
        self.theme = theme
    }
    
    init(_ text: Substring, theme: FigletTheme) {
        self.init(String(text), theme: theme)
    }
    
    var body: some View {
        FigletView(text, theme: theme, shadow: true)
    }
}

struct TerminalAlMessage: View {
    let text: String
    let items: [Item<Character>]
    let theme: ViewTheme
    
    init(_ text: String, theme: ViewTheme) {
        self.text = text
        self.theme = theme
        self.items = Array(text).map { Item($0) }
    }
    
    var body: some View {
        ForEach(items) { item in
            Text(String(item.content))
                .padding(.top, 12)
                .frame(width: 35, height: 60, alignment: .center)
                .withTheme(theme)
        }
    }
}
