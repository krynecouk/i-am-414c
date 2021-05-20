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
    var intro: IntroTheme { theme.intro }
    var keyboard: KeyboardTheme { theme.keyboard }
    var terminal: TerminalTheme { theme.terminal }
    
    init(type: ThemeType = .orange) {
        let type = ThemeDao.find() ?? type
        self.theme = type.toTheme()
    }
    
    func font(_ font: FontTheme) {
        self.theme = OrangeTheme(font: font)
    }
    
    func reset() {
        self.theme = OrangeTheme()
        ThemeDao.store(.orange)
    }
    
    func change(to type: ThemeType) {
        self.theme = type.toTheme()
        ThemeDao.store(type)
    }
}

enum ThemeType: String, Encodable, Decodable {
    case orange, green, blue
    case light_orange, light_green, light_blue
    case orangina, forest, ice
    case swamp, bananaSky, vintage, pastel, sunset
    case green_gold, summer, sea, gray, yellow, melon
    
    func toTheme() -> Themable {
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
        case .swamp:
            return SwampTheme()
        case .bananaSky:
            return BananaSkyTheme()
        case .vintage:
            return VintageTheme()
        case .pastel:
            return PastelTheme()
        case .sunset:
            return SunsetTheme()
        case .orangina:
            return OranginaTheme()
        case .forest:
            return ForestTheme()
        case .ice:
            return IceTheme()
        case .green_gold:
            return GreenGoldTheme()
        case .summer:
            return SummerTheme()
        case .sea:
            return SeaTheme()
        case .gray:
            return GrayTheme()
        case .yellow:
            return YellowTheme()
        case .melon:
            return MelonTheme()
        }
    }
}
