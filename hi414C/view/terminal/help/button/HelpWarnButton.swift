//
//  HelpWarnButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct HelpWarnButton: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let text: String
    let action: () -> Void
    let delete: Sound
    
    init(_ text: String, perform action: @escaping () -> Void = {}) {
        self.text = text
        self.action = action
        self.delete = Sound.of(.delete)
    }
    
    var body: some View {
        Button(action: {
            delete.play()
            action()
        }) {
            Text(text)
                .foregroundColor(themeVM.terminal.hli.button.passive.color) // TODO
                .font(Font.of(props: themeVM.terminal.hli.select.button.font))
                .padding(20)
                .frame(minWidth: 70, minHeight: 70)
                .background(RoundedRectangle(cornerRadius: 15.0)
                                .fill(Color.red.opacity(0.7)))
        }
    }
}
