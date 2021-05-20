//
//  HelpRadioButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct HelpRadioButton: View {
    @EnvironmentObject var themeVM: ThemeViewModel

    let text: String
    let active: Bool
    let action: () -> Void
    
    init(_ text: String, active: Bool = false, perform action: @escaping () -> Void = {}) {
        self.text = text
        self.active = active
        self.action = action
    }
    
    var body: some View {
            Button(action: action) {
                Text(text)
                    .padding()
                    .background(active ? themeVM.terminal.hli.select.button.background : themeVM.terminal.hli.button.passive.color.opacity(0.6))
                    .font(Font.of(props: themeVM.terminal.hli.select.button.font))
                    .foregroundColor(themeVM.terminal.hli.select.button.color.opacity(active ? 1 : 0.5))
            }
    }
}
