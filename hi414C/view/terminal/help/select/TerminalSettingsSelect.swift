//
//  TerminalSettingsSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct TerminalSettingsSelect: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var chatVM: ChatViewModel
    
    var body: some View {
        Group{
            if helpVM.settings == .font {
                Group {
                    let isDecreasable = themeVM.fontSize.isDecreasable()
                    HelpRadioButton("-1", active: isDecreasable) {
                        if isDecreasable {
                            themeVM.font(.decrease)
                        }
                    }
                    .disabled(!isDecreasable)
                    
                    let isIncreasable = themeVM.fontSize.isIncreasable()
                    HelpRadioButton("+1", active: isIncreasable) {
                        if isIncreasable {
                            themeVM.font(.increase)
                        }
                    }
                    .disabled(!isIncreasable)

                    HelpButton("default") {
                        themeVM.font(.reset)
                    }

                }
            }
            
            if helpVM.settings == .theme {
                Group {
                    HelpColorButton("Orange", .orange)
                    HelpColorButton("Green", .green)
                    HelpColorButton("Blue", .blue)
                    HelpColorButton("LightOrange", .light_orange)
                    HelpColorButton("LightGreen", .light_green)
                    HelpColorButton("LightBlue", .light_blue)
                }
                Group {
                    HelpColorButton("Orangina", .orangina)
                    HelpColorButton("Forest", .forest)
                    HelpColorButton("Ice", .ice)
                }
                Group {
                    HelpColorButton("Vintage", .vintage)
                    HelpColorButton("Melon", .melon)
                    HelpColorButton("Sea", .sea)
                    
                    HelpColorButton("Sunset", .sunset)
                    HelpColorButton("GreenGold", .green_gold)
                    HelpColorButton("Pastel", .pastel)
                    
                    HelpColorButton("BananaSky", .bananaSky)
                    HelpColorButton("Swamp", .swamp)
                    HelpColorButton("Gray", .gray)
                }
            }
            
            if helpVM.settings == .reset {
                HelpWarnButton("reset") {
                    withAnimation {
                        themeVM.reset()
                    }
                }
            }
            
            if helpVM.settings == .delete {
                HelpWarnButton("delete") {
                    withAnimation {
                        themeVM.reset()
                        graphVM.setGraph(.BIN)
                        asciiVM.reset()
                        chatVM.clear()
                        uiVM.current = .test
                        helpVM.current = .learn
                        helpVM.resetToZero()
                        uiVM.isHelp = false
                        uiVM.isIntroVideo = false // TODO true
                        uiVM.isIntro = true
                    }
                }
            }
        }
    }
}


/*
 HelpButton("no") {
 withAnimation {
 self.delete = false
 }
 }
 HelpWarnButton("yes") {
 themeVM.reset()
 graphVM.setGraph(.BIN)
 asciiVM.reset()
 chatVM.clear()
 uiVM.current = .test
 helpVM.resetToZero()
 uiVM.isHelp = false
 self.delete = false
 uiVM.isIntroVideo = false // TODO true
 uiVM.isIntro = true
 
 }
 .onAppear {
 DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
 withAnimation {
 self.delete = false
 }
 }
 }
 */
