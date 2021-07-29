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
    let size: Size
    let padding: CGFloat
    let color: Color?
    let withBackground: Bool
    let action: () -> Void
    
    init(
        _ text: String,
        sound type: SoundType? = .click,
        size: Size = (70, 70),
        padding: CGFloat = 20,
        color: Color? = nil,
        withBackground: Bool = true,
        perform action: @escaping () -> Void = {}) {
        
        self.text = text
        self.sound = Sound.of(type)
        self.size = size
        self.padding = padding
        self.color = color
        self.withBackground = withBackground
        self.action = action
    }
    
    var body: some View {
        let theme = themeVM.terminal.hli.select.button
        Button(action: {
            self.sound?.play()
            action()
        }) {
            Text(text)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .allowsTightening(true)
                .foregroundColor(self.color ?? theme.color)
                .font(Font.of(props: theme.font))
                .padding(self.padding)
                .frame(minWidth: size.width, minHeight: size.height)
                .background(withBackground ? RoundedRectangle(cornerRadius: 15.0).fill(theme.background!) : nil)
        }
    }
}
