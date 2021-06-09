//
//  HelpRadioButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

typealias HelpRadioButtonSound = (on: CustomSoundType?, off: CustomSoundType?)

struct HelpRadioButton: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let text: String
    let active: Bool
    let sound: (on: CustomSoundType?, off: CustomSoundType?)
    let action: () -> Void
    
    init(_ text: String, active: Bool = false, sound: HelpRadioButtonSound = (.click, .delete), perform action: @escaping () -> Void = {}) {
        self.text = text
        self.active = active
        self.sound = sound
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            if !active {
                if let sound = self.sound.on {
                    CustomSound.play(sound)
                }
            } else {
                if let sound = self.sound.off {
                    CustomSound.play(sound)
                }
            }
            action()
        }) {
            Text(text)
                .padding()
                .background(active ? themeVM.terminal.hli.select.button.background : themeVM.terminal.hli.button.passive.color.opacity(0.6))
                .font(Font.of(props: themeVM.terminal.hli.select.button.font))
                .foregroundColor(themeVM.terminal.hli.select.button.color.opacity(active ? 1 : 0.5))
        }
    }
}
