//
//  TerminalHelpLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

struct TerminalHelpLine: View {
    @Namespace private var ns
    
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
                if segueVM.isOpen {
                    segueVM.close()
                } else {
                    segueVM.open(type: getCurrentSegue())
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
        let isCurrent = currentSegue == type
        let isOpen = segueVM.isOpen
        let theme = themeVM.terminal.hli.button
        return
            ButtonLabel(text)
            .background(isCurrent && !isOpen ? theme.background.active.frame(height: 5).offset(y: 29.5).matchedGeometryEffect(id: "border", in: ns) : nil)
            .background(isCurrent && isOpen ? theme.background.active.matchedGeometryEffect(id: "border", in: ns, properties: .position) : nil)
            .withTheme(isCurrent && isOpen ? theme.active : theme.passive)
            .animation(.easeOut.speed(2.3))
            .onTapGesture {
                if isOpen {
                    openSegue(type)
                } else {
                    if isCurrent {
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
