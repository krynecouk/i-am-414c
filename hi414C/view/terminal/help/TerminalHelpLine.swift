//
//  TerminalHelpLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

struct TerminalHelpLine: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var helpVM: HelpViewModel
    
    @State var quitBackground: Color = .clear
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    SegueButton("Learn", .help) {
                        helpVM.current = .learn
                    }
                    SegueButton("Chat", .chat) {
                        helpVM.current = .chat
                    }
                    SegueButton("Settings", .settings) {
                        helpVM.current = .settings
                    }
                }
            }
            Spacer()
            MinButton()
            QuitButton("X")
        }
        //.onReceive(uiVM.$current) { helpVM.content(of: $0 == .message ? .chat : .learn) }
        .frame(height: SegueViewModel.header.height)
        .background(themeVM.terminal.hli.background.edgesIgnoringSafeArea(.all))
    }
    
    func ButtonLabel(_ text: String) -> some View {
        Text(text)
            .padding(.all, 13)
            .frame(height: SegueViewModel.header.height)
    }
    
    func MinButton() -> some View {
        Button(action: {
            withAnimation {
                if segueVM.isOpen {
                    segueVM.close()
                } else {
                    segueVM.open(type: getCurrentSegue())
                }
            }
        }) {
            ButtonLabel(segueVM.isOpen ? "-" : "[]")
                .withTheme(themeVM.terminal.hli.button.passive)
        }
    }
    
    func QuitButton(_ text: String) -> some View {
        Button(action: {
            if uiVM.detail.0 == true {
                uiVM.detail = (false, false)
            }
            withAnimation {
                segueVM.close()
                uiVM.isHelp = false
            }
        }) {
            ButtonLabel(text)
                .withTheme(themeVM.terminal.hli.button.passive)
        }
    }
    
    func SegueButton(_ text: String, _ type: SegueType, perform action: @escaping () -> Void = {}) -> some View {
        let currentSegue = getCurrentSegue()
        return ButtonLabel(text)
            .withTheme(currentSegue == type ? themeVM.terminal.hli.button.active : themeVM.terminal.hli.button.passive)
            .onTapGesture {
                if segueVM.isOpen {
                    openSegue(type)
                } else {
                    if currentSegue == type {
                        openSegue(type)
                    }
                }
                action()
            }
    }
    
    func getCurrentSegue() -> SegueType {
        switch helpVM.current {
        case .learn:
            return .help
        case .chat:
            return .chat
        case .settings:
            return .settings
        }
    }
    
    func openSegue(_ type: SegueType) {
        if segueVM.isOpen {
            segueVM.opened == type ? segueVM.close() : segueVM.open(type: type)
        } else {
            segueVM.open(type: type)
        }
    }
}
