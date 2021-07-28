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
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var helpVM: HelpViewModel
    
    @State var quitBackground: Color = .clear
    
    let delete: Sound = Sound.of(.delete)
    let modifier: Sound = Sound.of(.modifier)
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    SegueButton("Calc", .learn) {
                        helpVM.current = .learn
                    }
                    /*
                    Image(systemName: helpVM.current == .learn ? "plus.circle.fill" : "plus.circle")
                        .foregroundColor(.white)
                        .font(.system(size: 46.0, weight: .bold))
                    */
                    SegueButton("Chat", .chat) {
                        helpVM.current = .chat
                    }
                    SegueButton("Settings", .settings) {
                        helpVM.current = .settings
                    }
                }
            }
            Spacer()
            QuitButton("x")
        }
        .frame(height: SegueViewModel.header.height)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: SegueViewModel.header.height)))
        .background(themeVM.terminal.hli.background.edgesIgnoringSafeArea(.all))
    }
    
    func ButtonLabel(_ text: String) -> some View {
        Text(text)
            .padding(.all, 13)
            .frame(height: SegueViewModel.header.height)
    }
    
    func QuitButton(_ text: String) -> some View {
        Button(action: {
            delete.play()
            withAnimation {
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
    
    func SegueButton(_ text: String, _ type: HelpType, perform action: @escaping () -> Void = {}) -> some View {
        let isCurrent = helpVM.current == type
        let theme = themeVM.terminal.hli.button
        return
            ButtonLabel(text)
            .background(isCurrent ? theme.background.active.frame(height: 6).offset(y: -29.5).matchedGeometryEffect(id: "border", in: ns) : nil)
            //.background(isCurrent && isOpen ? theme.background.active.matchedGeometryEffect(id: "border", in: ns, properties: .position) : nil)
            .withTheme(isCurrent ? theme.active : theme.passive)
            .animation(.easeOut.speed(2.3))
            .onTapGesture {
                helpVM.current = type
                modifier.play()
                action()
            }
    }
}
