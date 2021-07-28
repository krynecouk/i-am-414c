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
        let theme = themeVM.terminal.hli.select.button
        Button(action: {
            self.sound?.play()
            action()
        }) {
            Text(text)
                .foregroundColor(theme.color)
                .font(Font.of(props: theme.font))
                .padding(20)
                .frame(minWidth: 70, minHeight: 70)
                .background(RoundedRectangle(cornerRadius: 15.0).fill(theme.background!))
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .allowsTightening(true)

        }
    }
}
