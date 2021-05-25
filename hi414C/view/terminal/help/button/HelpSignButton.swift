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
    
    init(_ text: String, _ type: EquationType) {
        self.text = text
        self.equationType = type
    }
    
    var body: some View {
        let active = helpVM.getBuilder(helpVM.equation) is T
        HelpRadioButton(text, active: active) {
            if active {
                helpVM.change(to: .ID)
            } else {
                helpVM.change(to: equationType)
            }
        }
        //.bevelBorder(light: .white, dark: .black, width: 3, visible: !active)
    }
}
