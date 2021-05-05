//
//  TerminalMessage.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

struct TerminalMessageRow: View {
    let text: String
    let theme: FigletTheme
    let wide: Bool
    
    init(_ text: String, wide: Bool, theme: FigletTheme) {
        self.text = text
        self.wide = wide
        self.theme = theme
    }
    
    var body: some View {
        MessageRow(of: text, wide: wide) {
            TerminalMessage(text, theme: theme)
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
    
    var body: some View {
        FigletView(text, theme: theme)
    }
}

struct TerminalAlMessage: View {
    let text: String
    let items: [ID]
    let theme: ViewTheme
    
    init(_ text: String, theme: ViewTheme) {
        self.text = text
        self.theme = theme
        self.items = Array(text).map { ID(char: $0) }
    }
    
    var body: some View {
        ForEach(items) { item in
            Text(String(item.char))
                .padding(.top, 12)
                .frame(width: 35, height: 60, alignment: .center)
                .withTheme(theme)
        }
    }
    
    struct ID: Identifiable {
        var id: UUID = UUID()
        var char: Character
    }
}
