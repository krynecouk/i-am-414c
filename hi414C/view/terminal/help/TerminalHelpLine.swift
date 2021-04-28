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
    
    @State var quitBck: Color = .clear
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    SegueTerminalLineButton("Help", .help)
                    //Spacer()
                    SegueTerminalLineButton("Settings", .settings)
                    SegueTerminalLineButton("Themes", .themes)
                }
            }
            Spacer()
            TerminalLineButton("X")
                .background(self.quitBck)
                .onTapGesture {
                    self.quitBck = Color("GoldBck")
                    withAnimation {
                        segueVM.close()
                        uiVM.isHelp = false
                    }
                }
        }

        .frame(height: SegueViewModel.header.height)
        .background(Color("BlackBck").edgesIgnoringSafeArea(.all))
    }
    
    
    func TerminalLineButton(_ text: String) -> some View {
        Text(text)
            .font(Font.custom(FontName.proggyTiny.rawValue, size: 34))
            .foregroundColor(.white)
            .padding(.all, 15)
            .frame(height: SegueViewModel.header.height)
    }
    
    func SegueTerminalLineButton(_ text: String, _ type: SegueType) -> some View {
        TerminalLineButton(text)
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
