//
//  ThemeViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published private(set) var theme: Themable
    
    var font: FontTheme { theme.font }
    var keyboard: KeyboardTheme { theme.keyboard }
    var terminal: TerminalTheme { theme.terminal }
    
    init(theme: Themable = OrangeTheme()) {
        self.theme = GreenTheme()
    }
    
    func font(_ font: FontTheme) {
        self.theme = OrangeTheme(font: font)
    }
    
    func reset() {
        self.theme = OrangeTheme()
    }
    
    func change(to type: ThemeType) {
        self.theme = type.rawValue()
    }
}

enum ThemeType {
    case orange
    
    func rawValue() -> Themable {
        switch self {
        case .orange:
            return OrangeTheme()
        }
    }
}
