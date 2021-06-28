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
    @EnvironmentObject var testVM: TestViewModel
    
    var body: some View {
        Group{
            if helpVM.settings == .font {
                Group {
                    let isDecreasable = themeVM.fontSize.isDecreasable()
                    HelpRadioButton("-1", active: isDecreasable, sound: (on: .click, off: .click)) {
                        if isDecreasable {
                            themeVM.font(.decrease)
                        }
                    }
                    .withDisabledSound(if: !isDecreasable)
                    
                    let isIncreasable = themeVM.fontSize.isIncreasable()
                    HelpRadioButton("+1", active: isIncreasable, sound: (on: .click, off: .click)) {
                        if isIncreasable {
                            themeVM.font(.increase)
                        }
                    }
                    .withDisabledSound(if: !isIncreasable)
                    
                    HelpButton("default", sound: .delete) {
                        themeVM.font(.reset)
                    }
                }
            }
            
            if helpVM.settings == .theme {
                Group {
                    HelpColorButton("Orange", .orange)
                    HelpColorButton("Green", .green)
                    HelpColorButton("Blue", .blue)
                }
            }
            
            if helpVM.settings == .difficulty {
                HelpRadioButton("easy", active: testVM.difficulty == .easy) {
                    testVM.difficulty(.easy)
                    graphVM.generateTests()
                }
                HelpRadioButton("medium", active: testVM.difficulty == .medium) {
                    testVM.difficulty(.medium)
                    graphVM.generateTests()
                }
                HelpRadioButton("hard", active: testVM.difficulty == .hard) {
                    testVM.difficulty(.hard)
                    graphVM.generateTests()
                }
            }
            
            if helpVM.settings == .delete {
                WarnText("Delete all progress and start again?")
                
                if !isSmallPhone {
                    Color.clear
                }
                HelpWarnButton("ok") {
                    GameOverDao.store(false)
                    CmdDao.remove()
                    testVM.reset()
                    asciiVM.reset()
                    chatVM.reset()
                    helpVM.reset()
                    themeVM.reset()
                    graphVM.reset()
                    withAnimation {
                        uiVM.reset()
                        // uiVM.video = .intro // TODO
                    }
                }
                .padding(.bottom, 20)
                .padding(.top, 5)
            }
        }
    }
    

    
    func WarnText(_ text: String) -> some View {
        Group {
            if !isSmallPhone {
                Color.clear
            }
            Text(text)
                .lineLimit(3)
                .withTheme(themeVM.terminal.hli.button.active)
                .multilineTextAlignment(.center)
                .frame(width: isSmallPhone ? nil : 350)
                .padding(.bottom, 20)
                .padding(.top, 5)
                .onAppear {
                    print(UIScreen.main.bounds.width)
                }
            if !isSmallPhone {
                Color.clear
            }
        }
    }
    
    var isSmallPhone: Bool {
        UIScreen.main.bounds.width <= 375
    }
}
