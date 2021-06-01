//
//  ThemeViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    static let hint: Size = (.infinity, 54)
    
    @Published var theme: Themable
    
    var font: FontTheme { theme.font }
    var fontSize: FontSize = FontSize()
    var intro: IntroTheme { theme.intro }
    var keyboard: KeyboardTheme { theme.keyboard }
    var terminal: TerminalTheme { theme.terminal }
    
    init(type: ThemeType = .orange, size: FontSize = FontSize()) {
        let type = ThemeDao.find() ?? type
        let size = FontDao.find() ?? size
        self.theme = type.toTheme(font: FontTheme(size: size))
        self.fontSize = size
    }
    
    func reset() {
        let type = ThemeDao.find() ?? .orange
        let size = FontDao.find() ?? FontSize()
        self.theme = type.toTheme(font: FontTheme(size: size))
        self.fontSize = size
    }
    
    func `default`() {
        font(.reset)
        change(to: .orange)
    }
    
    func change(to type: ThemeType) {
        let font = FontTheme(size: fontSize)
        self.theme = type.toTheme(font: font)
        ThemeDao.store(type)
    }
    
    func font(_ operation: FontOperation) {
        self.fontSize = fontSize(operation)
        let font = FontTheme(size: self.fontSize)
        self.theme = theme.type.toTheme(font: font)
        FontDao.store(self.fontSize)
    }

    func fontSize(_ operation: FontOperation) -> FontSize {
        switch operation {
        case .increase:
            return fontSize.inc()
        case .decrease:
            return fontSize.dec()
        case .reset:
            return fontSize.reset()
        }
    }
}

enum FontOperation {
    case increase, decrease, reset
}

enum ThemeType: String, Encodable, Decodable {
    case generic, orange, green, blue
    case light_orange, light_green, light_blue
    case orangina, forest, ice
    case swamp, bananaSky, vintage, pastel, sunset
    case green_gold, summer, sea, gray, yellow, melon
    case panic
    
    func toTheme(font: FontTheme = FontTheme()) -> Themable {
        switch self {
        case .orange:
            return OrangeTheme(font: font)
        case .green:
            return GreenTheme(font: font)
        case .blue:
            return BlueTheme(font: font)
        case .light_orange:
            return LightOrangeTheme(font: font)
        case .light_green:
            return LightGreenTheme(font: font)
        case .light_blue:
            return LightBlueTheme(font: font)
        case .swamp:
            return SwampTheme(font: font)
        case .bananaSky:
            return BananaSkyTheme(font: font)
        case .vintage:
            return VintageTheme(font: font)
        case .pastel:
            return PastelTheme(font: font)
        case .sunset:
            return SunsetTheme(font: font)
        case .orangina:
            return OranginaTheme(font: font)
        case .forest:
            return ForestTheme(font: font)
        case .ice:
            return IceTheme(font: font)
        case .green_gold:
            return GreenGoldTheme(font: font)
        case .summer:
            return SummerTheme(font: font)
        case .sea:
            return SeaTheme(font: font)
        case .gray:
            return GrayTheme(font: font)
        case .yellow:
            return YellowTheme(font: font)
        case .melon:
            return MelonTheme(font: font)
        default:
            return OrangeTheme(font: font)
        }
    }
}
