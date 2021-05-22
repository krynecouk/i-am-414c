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
    @EnvironmentObject var historyVM: HistoryViewModel
    
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
                
                HelpButton("font0") {
                    themeVM.font(.reset)
                }

                HelpRadioButton("hint", active: themeVM.hint) {
                    themeVM.hint ? themeVM.hideHint() : themeVM.showHint()
                }

                HelpRadioButton("wave", active: themeVM.wave) {
                    themeVM.wave ? themeVM.hideWave() : themeVM.showWave()
                }

                HelpButton("reset") {
                    themeVM.reset()
                }
            }
            .opacity(delete ? 0.3 : 1)

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
                    graphVM.setGraph(root: Graphs.HI)
                    asciiVM.reset()
                    uiVM.current = .test
                    helpVM.resetToZero()
                    uiVM.isHelp = false
                    historyVM.replace(with: [])
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
