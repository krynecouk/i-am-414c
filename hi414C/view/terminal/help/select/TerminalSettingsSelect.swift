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
    
    @State var delete = false
    
    var body: some View {
        Group{
            Group {
                let isDecreasable = themeVM.fontSize.isDecreasable()
                HelpRadioButton("font-", active: isDecreasable) {
                    if isDecreasable {
                        themeVM.font(.decrease)
                    }
                }
                .disabled(!isDecreasable)
                
                let isIncreasable = themeVM.fontSize.isIncreasable()
                HelpRadioButton("font+", active: isIncreasable) {
                    if isIncreasable {
                        themeVM.font(.increase)
                    }
                }
                .disabled(!isIncreasable)
                
                HelpRadioButton("hint", active: themeVM.hint) {
                    themeVM.hint ? themeVM.hideHint() : themeVM.showHint()
                }
            }
            .opacity(delete ? 0.3 : 1)
            
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

            if !delete {
                HelpWarnButton("delete") {
                    withAnimation {
                        self.delete = true
                    }
                }
            } else {
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
            }
        }
    }
}
