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
        
    @State var height: CGFloat = 0
    
    var body: some View {
        if helpVM.current == .settings {
            GeometryReader { metrics in
                let height = getHeight(frame: metrics.size)
                Grid(columns: height > 320 ? GridType.one.rawValue() : GridType.double.rawValue(), spacing: 10, padding: 10, top: height > 500 ? (height/2 - (2*80) - 45) : 10) {
                    SettingsButton("FONT", .font, frame: metrics.size)
                    SettingsButton("THEME", .theme, frame: metrics.size)
                    SettingsButton("DIFFICULTY", .difficulty, frame: metrics.size)
                    SettingsButton("NEW GAME", .delete, frame: metrics.size)
                }
                .frame(width: metrics.size.width, height: height, alignment: .center)
                .onAppear {
                    self.height = height
                }
                .animation(.default.speed(2.3), value: height)
                .animation(.default.speed(1), value: themeVM.fontSize.robot)
                //.animation(.default.speed(0.7), value: themeVM.theme.type)
            }
        }
    }
    
    func getHeight(frame: CGSize) -> CGFloat {
        let result: CGFloat = frame.height
        var diff: CGFloat = 0
        
        if segueVM.isOpen {
            diff += segueVM.help.height
        } else {
            diff += SegueViewModel.header.height
        }
        return result - diff
    }
    
    func SettingsButton(_ text: String, _ type: HelpSettingsType, frame: CGSize, perform action: @escaping () -> Void = {}) -> some View {
        ZStack {
            Rectangle()
                .fill(helpVM.settings == type ? themeVM.terminal.help.settings.background.active : themeVM.terminal.help.settings.background.passive)
                .frame(width: 325, height: 80)
                .bevelBorder(
                    light: helpVM.settings == type ? themeVM.terminal.help.settings.background.active : themeVM.terminal.help.settings.active.color,
                    dark: themeVM.terminal.help.settings.background.active, width: 4)
            Text(text)
                .lineLimit(1)
                .allowsTightening(true)
                .withTheme(helpVM.settings == type ? themeVM.terminal.help.settings.active : themeVM.terminal.help.settings.passive)
        }
        .onTapGesture {
            helpVM.settings = type
            segueVM.open(type: .settings)
            action()
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
    let visible: Bool
    
    init(light: Color, dark: Color, width: CGFloat = 4, visible: Bool = true) {
        self.light = light
        self.dark = dark
        self.width = width
        self.offset = width/2
        self.visible = visible
    }
    
    func body(content: Content) -> some View {
        if visible {
            content
                .overlay(
                    Rectangle()
                        .stroke(self.light.opacity(0.6), lineWidth: self.width)
                        .offset(x: self.offset, y: self.offset)
                        .clipped()
                )
                .overlay(
                    Rectangle()
                        .stroke(self.dark, lineWidth: width)
                        .offset(x: -self.offset, y: -self.offset)
                        .clipped()
                )
        } else {
            content
        }
    }
}

extension View {
    func bevelBorder(light: Color, dark: Color, width: CGFloat, visible: Bool = true) -> some View {
        self.modifier(BevelBorder(light: light, dark: dark, width: width, visible: visible))
    }
}

