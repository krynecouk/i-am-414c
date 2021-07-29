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
    let fontSizeModifier: CGFloat
    let action: () -> Void
    
    init(_ text: String, active: Bool = false, sound type: HelpRadioButtonSound = (.click, .delete), fontSizeModifier: CGFloat = 0, perform action: @escaping () -> Void = {}) {
        self.text = text
        self.active = active
        self.sound = (Sound.of(type.on), Sound.of(type.off))
        self.fontSizeModifier = fontSizeModifier
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
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .allowsTightening(true)
                .padding(20)
                .frame(minWidth: 70, minHeight: 70)
                .background(RoundedRectangle(cornerRadius: 15.0)
                                .fill(
                                    active
                                        ? themeVM.terminal.hli.select.button.background!
                                        : themeVM.terminal.hli.button.passive.color.opacity(0.6)))
                .font(Font.of(
                        name: themeVM.terminal.hli.select.button.font.name,
                        size: themeVM.terminal.hli.select.button.font.size + self.fontSizeModifier))
                .foregroundColor(themeVM.terminal.hli.select.button.color.opacity(active ? 1 : 0.5))
        }
    }
}
