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
                Grid(columns: height > 320 ? GridType.one.rawValue() : GridType.double.rawValue(), spacing: 10, top: height > 500 ? (height/2 - (2*80) - 45) : 0) {
                    SettingsButton("FONT", .font, frame: metrics.size)
                    SettingsButton("THEME", .theme, frame: metrics.size)
                    SettingsButton("HINT", .hint, frame: metrics.size)
                    SettingsButton("DELETE", .delete, frame: metrics.size)
                }
                .frame(width: metrics.size.width, height: height, alignment: .center)
                .onAppear {
                    self.height = height
                }
                .animation(.default.speed(2.3), value: height)
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

            ZStack {
                if helpVM.settings == type {
                    Rectangle()
                        .fill(themeVM.terminal.help.settings.background.active)
                        .frame(width: 340, height: 80)
                } else {
                    Rectangle()
                        .fill(themeVM.terminal.help.settings.background.passive)
                        .frame(width: 340, height: 80)
                        .bevelBorder(light: themeVM.terminal.help.settings.active.view.color, dark: themeVM.terminal.help.settings.background.active, width: 4)
                    
                }
                
                HStack {
                    LiteFigletView(text, theme: helpVM.settings == type ? themeVM.terminal.help.settings.active : themeVM.terminal.help.settings.passive)
                }
            }
            .onTapGesture {
                    helpVM.settings = helpVM.settings == type ? .none : type
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

