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
    
    let delete: Sound = Sound.of(.delete)
    let modifier: Sound = Sound.of(.modifier)
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    SegueButton("Learn", .learn) {
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
            QuitButton("x")
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
                delete.play()
                segueVM.close()
            } else {
                modifier.play()
                segueVM.open(type: getCurrentSegue())
            }
        }) {
            if segueVM.isOpen {
                ButtonLabel("-")
                    .withTheme(themeVM.terminal.hli.button.passive)
            } else {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 15, height: 15)
                    .border(themeVM.terminal.hli.button.passive.color, width: 1.7)
                    .offset(y: -1.4)
                    .padding(.all, 13)
            }
            
        }
    }
    
    func QuitButton(_ text: String) -> some View {
        Button(action: {
            delete.play()
            withAnimation {
                segueVM.close()
                if uiVM.detail.0 == true {
                    uiVM.detail = (false, false)
                }
                uiVM.isHelp = false
            }
        }) {
            ButtonLabel(text)
                .offset(y: -1.4)
                .withTheme(themeVM.terminal.hli.quit)
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
                    if isCurrent {
                        delete.play()
                    } else {
                        modifier.play()
                    }
                    toggleSegue(type)
                } else {
                    if isCurrent {
                        modifier.play()
                        toggleSegue(type)
                    } else {
                        modifier.play()
                    }
                }
                action()
            }
    }
    
    func getCurrentSegue() -> SegueType {
        switch helpVM.current {
        case .learn:
            return .learn
        case .chat:
            return .chat
        case .settings:
            return .settings
        }
    }
    
    func toggleSegue(_ type: SegueType) {
        if segueVM.isOpen {
            segueVM.opened == type ? segueVM.close() : segueVM.open(type: type)
        } else {
            segueVM.open(type: type)
        }
    }
}
