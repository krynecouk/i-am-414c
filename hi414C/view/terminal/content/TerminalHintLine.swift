//
//  TerminalHintLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 25.07.2021.
//

import SwiftUI

struct TerminalHintLine: View {
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let modifier: Sound = Sound.of(.modifier)
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(uiVM.withHint ? themeVM.terminal.hintli.active.background! : themeVM.terminal.hintli.passive.background!)
                .edgesIgnoringSafeArea(.all)
            HStack {
                Text(active: uiVM.withHint)
            }
        }
        .frame(height: SegueViewModel.header.height)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: SegueViewModel.header.height)))
        .onTapGesture {
            withAnimation {
                modifier.play()
                uiVM.withHint.toggle()
            }
        }
    }
    
    func Text(active: Bool = false) -> LiteFigletView {
        let activeTheme = FigletTheme(
            typeface: .ansi(.regular),
            view: ViewTheme(
                font: FontProps(.terminus, 7.3),
                color: Color("SecondaryOrange")
            )
        )
        
        let passiveTheme = FigletTheme(
            typeface: .ansi(.regular),
            view: ViewTheme(
                font: FontProps(.terminus, 7.3),
                color: Color("SecondaryOrange")
            )
        )
        
        return LiteFigletView("?", theme: active ? activeTheme : passiveTheme, shadow: active, shadowOffset: (3, 3))
    }
}
