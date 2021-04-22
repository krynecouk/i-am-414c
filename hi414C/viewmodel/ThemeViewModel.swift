//
//  ThemeViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published var keyboard: KeyboardTheme
    @Published var terminal: TerminalTheme
    
    init() {
        self.keyboard = PrimaryTheme.keyboard
        self.terminal = PrimaryTheme.terminal
    }
    
    enum ThemeType {
        case keyboard, terminal
    }
    
    func reset(of type: ThemeType) {
        switch type {
        case .keyboard:
            self.keyboard = PrimaryTheme.keyboard
        case .terminal:
            self.terminal = PrimaryTheme.terminal
        }
    }
}
