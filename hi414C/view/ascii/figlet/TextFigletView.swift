//
//  TextFigletView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 26.05.2021.
//

import SwiftUI

struct TextFigletView: View {
    let text: String
    let chars: [Character]
    var theme: LiteFigletTheme
    
    init(_ text: String, theme: LiteFigletTheme = LiteFigletTheme()) {
        self.text = text
        self.chars = Array(text)
        self.theme = theme
    }
    
    var body: some View {
        Group {
            ForEach(chars.indices) { i in
                Text(String(chars[i]))
                    .font(Font.of(props: FontProps(.ansiRegular, 70)))
                    .lineSpacing(15)
                    .foregroundColor(Color.primary("Orange"))
                    .withTheme(theme.view)
            }
        }
    }
}

struct TextFigletView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TextFigletView("HELLO")
        }
    }
}
