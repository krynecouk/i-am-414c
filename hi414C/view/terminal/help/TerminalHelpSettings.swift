//
//  TerminalHelpSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 24.05.2021.
//

import SwiftUI

struct TerminalHelpSettings: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 300, maximum: .infinity))]
    
    var body: some View {
        if helpVM.current == .settings {
            GeometryReader { metrics in
                Grid(columns: TerminalHelpSettings.ADAPTIVE, spacing: 10, padding: 20) {
                    SettingsButton("FONT", .font, frame: metrics.size)
                    SettingsButton("THEME", .theme, frame: metrics.size)
                    SettingsButton("HINT", .hint, frame: metrics.size)
                    SettingsButton("DELETE", .delete, frame: metrics.size)
                }
                .frame(width: metrics.size.width, height: getHeight(frame: metrics.size), alignment: .center)
            }
        }
    }
    
    func getHeight(frame: CGSize) -> CGFloat {
        let result: CGFloat = frame.height
        var diff: CGFloat = 0
        
        if segueVM.isOpen {
            diff += segueVM.settings.height
        } else {
            if themeVM.hint {
                diff += ThemeViewModel.hint.height
            }
            diff += SegueViewModel.header.height
        }
        return result - diff
    }
    
    func SettingsButton(_ text: String, _ type: HelpSettingsType, frame: CGSize, perform action: @escaping () -> Void = {}) -> some View {
        Button(action: {
            helpVM.settings = type
            segueVM.open(type: .settings)
            action()
        }) {
            ZStack {
                let rect = Rectangle()
                    .frame(width: 350, height: 80)
                
                if helpVM.settings == type {
                    Rectangle()
                        .fill(themeVM.terminal.help.settings.background.active)
                        .frame(width: 350, height: 80)
                } else {
                    Rectangle()
                        .fill(themeVM.terminal.help.settings.background.passive)
                        .frame(width: 350, height: 80)
                        .bevelBorder(light: themeVM.terminal.help.settings.active.view.color, dark: themeVM.terminal.help.settings.background.active, width: 4)
                    
                }
                
                HStack {
                    LiteFigletView(text, theme: helpVM.settings == type ? themeVM.terminal.help.settings.active : themeVM.terminal.help.settings.passive)
                }
            }
        }
    }
    
    enum GridType {
        case one, double
        
        private static let ONE = [GridItem(.flexible())]
        private static let DOUBLE = [GridItem(.flexible()), GridItem(.flexible())]
        
        func rawValue() -> [GridItem] {
            switch self {
            case .one:
                return GridType.ONE
            case .double:
                return GridType.DOUBLE
            }
        }
    }
}

struct BevelBorder: ViewModifier {
    let light: Color
    let dark: Color
    let width: CGFloat
    let offset: CGFloat
    
    init(light: Color, dark: Color, width: CGFloat = 4) {
        self.light = light
        self.dark = dark
        self.width = width
        self.offset = width/2
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .stroke(self.light, lineWidth: self.width)
                    .offset(x: self.offset, y: self.offset)
                    .clipped()
            )
            .overlay(
                Rectangle()
                    .stroke(self.dark, lineWidth: width)
                    .offset(x: -self.offset, y: -self.offset)
                    .clipped()
            )
    }
}

extension View {
    func bevelBorder(light: Color, dark: Color, width: CGFloat) -> some View {
        self.modifier(BevelBorder(light: light, dark: dark, width: width))
    }
}

