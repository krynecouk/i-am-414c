//
//  TerminalHelp.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.04.2021.
//

import SwiftUI

struct TerminalHelp: View {
    
    let text: String
    let theme: FigletTheme
    
    init(_ text: String, _ theme: FigletTheme = FigletTheme()) {
        print("TerminalHelp")
        self.text = text
        self.theme = theme
    }
    
    var body: some View {
        FigletView(text, theme: theme)
    }
}

/*
struct TerminalHelp_Previews: PreviewProvider {
    static var previews: some View {
        TerminalHelp()
    }
}
 */
