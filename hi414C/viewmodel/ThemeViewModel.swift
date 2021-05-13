//
//  ThemeViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published var theme: Themable
    
    var keyboard: KeyboardTheme { theme.keyboard }
    var terminal: TerminalTheme { theme.terminal }
    
    init(theme: Themable = PrimaryTheme()) {
        self.theme = PrimaryTheme()
    }
    
    func font(_ font: FontTheme) {
        self.theme = PrimaryTheme(font: font)
    }
    
    func reset() {
        self.theme = PrimaryTheme()
    }
}
