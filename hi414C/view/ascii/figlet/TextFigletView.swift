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
    var theme: ViewTheme
    
    init(_ text: String, theme: ViewTheme = ViewTheme()) {
        self.text = text
        self.chars = Array(text)
        self.theme = theme
    }
    
    var body: some View {
        ForEach(chars.indices) { i in
            Text(String(chars[i]))
                .lineSpacing(15)
                .withTheme(theme)
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
