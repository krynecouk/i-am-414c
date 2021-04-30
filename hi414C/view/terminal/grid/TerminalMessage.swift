//
//  TerminalMessage.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

struct TerminalMessage: View {
    let text: String
    let theme: FigletTheme
    
    init(_ text: String, theme: FigletTheme) {
        print("TerminalMessage")
        self.text = text
        self.theme = theme
    }
    
    var body: some View {
        //DetailRow(of: Array(text)) {
            FigletView(text, theme: theme)
        //}
    }
}
