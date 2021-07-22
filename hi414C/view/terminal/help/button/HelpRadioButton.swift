//
//  HelpRadioButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

typealias HelpRadioButtonSound = (on: SoundType?, off: SoundType?)

struct HelpRadioButton: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let text: String
    let active: Bool
    let sound: (on: Sound?, off: Sound?)
    let action: () -> Void
    
    init(_ text: String, active: Bool = false, sound type: HelpRadioButtonSound = (.click, .delete), perform action: @escaping () -> Void = {}) {
        self.text = text
        self.active = active
        self.sound = (Sound.of(type.on), Sound.of(type.off))
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            if !active {
                sound.on?.play()
            } else {
                sound.off?.play()
            }
            action()
        }) {
            Text(text)
                .padding(20)
                .background(active ? themeVM.terminal.hli.select.button.background : themeVM.terminal.hli.button.passive.color.opacity(0.6))
                .font(Font.of(props: themeVM.terminal.hli.select.button.font))
                .foregroundColor(themeVM.terminal.hli.select.button.color.opacity(active ? 1 : 0.5))
        }
    }
}
