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
    let sound: Sound?
    let action: () -> Void
    
    init(_ text: String, sound type: SoundType? = .click, perform action: @escaping () -> Void = {}) {
        self.text = text
        self.sound = Sound.of(type)
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            self.sound?.play()
            action()
        }) {
            Text(text)
                .padding(20)
                .withTheme(themeVM.terminal.hli.select.button)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .allowsTightening(true)
        }
    }
}
