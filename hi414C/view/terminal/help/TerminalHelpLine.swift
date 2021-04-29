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
    
    @State var quitBackground: Color = .clear
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    SegueButton("Learn", .help)
                    SegueButton("Settings", .settings)
                    SegueButton("Themes", .themes)
                }
            }
            Spacer()
            QuitButton("X")
        }
        .frame(height: SegueViewModel.header.height)
        .background(Color("BlackBck").edgesIgnoringSafeArea(.all))
    }
    
    func ButtonLabel(_ text: String) -> some View {
        Text(text)
            .font(Font.custom(FontName.proggyTiny.rawValue, size: 32))
            .foregroundColor(.white)
            .padding(.all, 15)
            .frame(height: SegueViewModel.header.height)
    }
    
    func QuitButton(_ text: String) -> some View {
        ButtonLabel(text)
            .background(self.quitBackground)
            .onTapGesture {
                self.quitBackground = Color("GoldBck")
                withAnimation {
                    segueVM.close()
                    uiVM.isHelp = false
                }
            }
    }
    
    func SegueButton(_ text: String, _ type: SegueType) -> some View {
        ButtonLabel(text)
                .background(segueVM.opened == type ? Color("GoldBck") : Color.clear)
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
