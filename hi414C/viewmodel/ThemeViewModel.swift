//
//  ThemeViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published var theme: Theme
    
    var keyboard: KeyboardTheme { theme.keyboard }
    var terminal: TerminalTheme { theme.terminal }
    
    init(theme: Theme = Theme()) {
        self.theme = Theme()
    }
    
    func font(_ font: FontTheme) {
        self.theme = Theme(font: font)
    }
    
    func reset() {
        self.theme = Theme()
    }
}
