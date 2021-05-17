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
        self.theme = FooTheme()
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
    case orange, green, blue, light_orange, light_green, light_blue, green_gold
    case swamp, bananaSky, vintage, pastel, ice, sunset
    
    func rawValue() -> Themable {
        switch self {
        case .orange:
            return OrangeTheme()
        case .green:
            return GreenTheme()
        case .blue:
            return BlueTheme()
        case .light_orange:
            return LightOrangeTheme()
        case .light_green:
            return LightGreenTheme()
        case .light_blue:
            return LightBlueTheme()
        case .green_gold:
            return GreenGoldTheme()
        case .swamp:
            return SwampTheme()
        case .bananaSky:
            return BananaSkyTheme()
        case .vintage:
            return VintageTheme()
        case .pastel:
            return PastelTheme()
        case .ice:
            return IceTheme()
        case .sunset:
            return SunsetTheme()
        }
    }
}
