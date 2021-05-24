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
                    SegueButton("Learn", .help)
                    SegueButton("Chat", .chat)
                    SegueButton("Settings", .settings)
                }
            }
            Spacer()
            QuitButton("X")
        }
        .frame(height: SegueViewModel.header.height)
        .background(themeVM.terminal.hli.background.edgesIgnoringSafeArea(.all))
    }
    
    func ButtonLabel(_ text: String) -> some View {
        Text(text)
            .padding(.all, 15)
            .frame(height: SegueViewModel.header.height)
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
    
    func SegueButton(_ text: String, _ type: SegueType) -> some View {
        ButtonLabel(text)
            .withTheme(segueVM.opened == type ? themeVM.terminal.hli.button.active : themeVM.terminal.hli.button.passive)
                .onTapGesture {
                    openSegue(type)
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
