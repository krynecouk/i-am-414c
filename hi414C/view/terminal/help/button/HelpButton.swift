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
    let sound: SoundType?
    let action: () -> Void
    
    init(_ text: String, sound: SoundType? = .click, perform action: @escaping () -> Void = {}) {
        self.text = text
        self.sound = sound
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            if let sound = self.sound {
                Sound.of(sound).play()
            }
            action()
        }) {
            Text(text)
                .padding()
                .withTheme(themeVM.terminal.hli.select.button)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .allowsTightening(true)
        }
    }
}
