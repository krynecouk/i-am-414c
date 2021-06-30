//
//  HelpSignButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct HelpSignButton<T>: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var helpVM: HelpViewModel

    let text: String
    let equationType: EquationType
    let sound: (on: SoundType?, off: SoundType?)
    
    init(_ text: String, _ type: EquationType, sound: HelpRadioButtonSound = (.click, .delete)) {
        self.text = text
        self.equationType = type
        self.sound = sound
    }
    
    var body: some View {
        let active = helpVM.getBuilder(helpVM.equation) is T
        HelpRadioButton(self.text, active: active, sound: self.sound) {
            if active {
                helpVM.change(to: .ID)
            } else {
                helpVM.change(to: equationType)
            }
        }
        // TODO maybe add bevel?
        //.bevelBorder(light: themeVM.theme.terminal.hli.button.passive.color, dark: themeVM.theme.terminal.hli.button.passive.background ?? .black, width: 3, visible: !active)
    }
}
