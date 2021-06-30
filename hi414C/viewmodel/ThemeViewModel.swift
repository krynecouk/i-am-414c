//
//  ThemeViewModel.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

import SwiftUI

class ThemeViewModel: ObservableObject, Resetable {
    static let hint: Size = (.infinity, 54)
    
    @Published var theme: Themable
    
    var font: FontTheme { theme.font }
    var color: ColorTheme { theme.color }
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
        font(.reset)
        change(to: .orange)
    }
    
    func restore() {
        let type = ThemeDao.find() ?? .orange
        let size = FontDao.find() ?? FontSize()
        self.theme = type.toTheme(font: FontTheme(size: size))
        self.fontSize = size
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
    case orange, green, blue
    case panic, warn, shake
    case generic
    
    func toTheme(font: FontTheme = FontTheme()) -> Themable {
        switch self {
        case .orange:
            return OrangeTheme(font: font)
        case .green:
            return GreenTheme(font: font)
        case .blue:
            return BlueTheme(font: font)
        default:
            return OrangeTheme(font: font)
        }
    }
}
