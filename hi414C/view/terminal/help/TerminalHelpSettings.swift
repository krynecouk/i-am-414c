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
                        .windowsBorder(light: themeVM.terminal.help.settings.active.view.color, dark: themeVM.terminal.help.settings.background.active)
                    
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

struct WindowsBorder: ViewModifier {
    let light: Color
    let dark: Color
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .stroke(self.light, lineWidth: 4)
                    .offset(x: 2, y: 2)
                    .clipped()
            )
            .overlay(
                Rectangle()
                    .stroke(self.dark, lineWidth: 4)
                    .offset(x: -2, y: -2)
                    .clipped()
            )
    }
}

extension View {
    func windowsBorder(light: Color, dark: Color) -> some View {
        self.modifier(WindowsBorder(light: light, dark: dark))
    }
}

