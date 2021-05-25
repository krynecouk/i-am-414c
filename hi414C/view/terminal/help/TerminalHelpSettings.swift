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
    
    var body: some View {
        if helpVM.current == .settings {
            GeometryReader { metrics in
                ScrollView {
                    VStack {
                        FontButton()
                        ThemeButton()
                        HintButton()
                        DeleteButton()
                    }
                    .frame(width: metrics.size.width, height: metrics.size.height - segueVM.settings.height, alignment: .center)
                }
            }
        }
    }
    
    
    func SettingsButton(_ text: String, _ type: HelpSettingsType) -> some View {
        Button(action: {
            helpVM.settings = type
            segueVM.open(type: .settings)
        }) {
            ZStack {
                if helpVM.settings == type {
                    Rectangle()
                        .fill(themeVM.terminal.help.settings.background.active)
                        .frame(width: 350, height: 80)
                } else {
                    Rectangle()
                        .fill(themeVM.terminal.help.settings.background.passive)
                        .frame(width: 350, height: 80)
                        .overlay(
                            Rectangle()
                                .stroke(themeVM.terminal.help.settings.active.view.color, lineWidth: 4)
                                .offset(x: 2, y: 2) // 1
                                .clipped()
                        )
                        .overlay(
                            Rectangle()
                                .stroke(themeVM.terminal.help.settings.background.active, lineWidth: 4)
                                .offset(x: -2, y: -2)
                                .clipped() // 1
                        )

                }


                HStack {
                    LiteFigletView(text, theme: helpVM.settings == type ? themeVM.terminal.help.settings.active : themeVM.terminal.help.settings.passive)
                }
            }
        }
    }
    
    
    func FontButton() -> some View {
        SettingsButton("FONT", .font)
    }
    
    func ThemeButton() -> some View {
        SettingsButton("THEME", .theme)
    }
    
    func HintButton() -> some View {
        SettingsButton("HINT", .hint)
    }
    
    func DeleteButton() -> some View {
        SettingsButton("DELETE", .delete)
    }
}

