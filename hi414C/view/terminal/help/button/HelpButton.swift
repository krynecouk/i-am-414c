//
//  HelpButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct HelpButton: View {
    @EnvironmentObject var themeVM: ThemeViewModel

    let text: String
    let action: () -> Void
    
    init(_ text: String, perform action: @escaping () -> Void = {}) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .withTheme(themeVM.terminal.hli.select.button)
        }
    }
}