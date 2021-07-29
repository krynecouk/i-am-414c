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
    
    @State var frame: CGRect = CGRect()
    @State var landscape: Bool = false
    @State var tablet: Bool = false
    
    var body: some View {
        Group {
            if helpVM.settings == .font {
                Font()
            }
            if helpVM.settings == .theme {
                Theme()
            }
            if helpVM.settings == .difficulty {
                Difficulty()
            }
            if helpVM.settings == .delete {
                NewGame()
            }
        }
        .background(GeometryReader { metrics in
            Color.clear
                .onAppear {
                    self.frame = metrics.frame(in: .global)
                    self.landscape = self.frame.maxY < 400
                    self.tablet = self.frame.maxX > 700 && self.frame.maxY > 700
                }
                .onChange(of: metrics.size) { size in
                    self.frame = metrics.frame(in: .global)
                    self.landscape = self.frame.maxY < 400
                    self.tablet = self.frame.maxX > 700 && self.frame.maxY > 700
                }
        })
        .padding(20)
        .padding(.bottom, 60)
        .background(themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all))
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: -SegueViewModel.header.height)))
    }
    
    func ThreeButtonContainer<Content: View>(_ content: () -> Content) -> some View {
        HStack {
            if landscape || tablet {
                Spacer()
            }
            ButtonContainer(padding: landscape ? 5 : 20, visible: !landscape) {
                content()
            }
            if landscape || tablet {
                Spacer()
            }
        }
    }
    
    func Font() -> some View {
        ThreeButtonContainer {
            HStack {
                let isDecreasable = themeVM.fontSize.isDecreasable()
                HelpRadioButton("-", active: isDecreasable, sound: (on: .click, off: .click)) {
                    if isDecreasable {
                        themeVM.font(.decrease)
                    }
                }
                .withDisabledSound(if: !isDecreasable)
                .padding(.trailing, landscape || tablet ? 15 : 0)
                
                if !landscape && !tablet {
                    Spacer()
                }
                
                let isIncreasable = themeVM.fontSize.isIncreasable()
                HelpRadioButton("+", active: isIncreasable, sound: (on: .click, off: .click)) {
                    if isIncreasable {
                        themeVM.font(.increase)
                    }
                }
                .withDisabledSound(if: !isIncreasable)
                .padding(.trailing, landscape || tablet ? 15 : 0)
                
                if !landscape && !tablet {
                    Spacer()
                }
                
                let isResetable = !themeVM.fontSize.isDefault()
                HelpRadioButton("reset", active: isResetable, sound: (on: .click, off: .click)) {
                    if isResetable {
                        themeVM.font(.reset)
                    }
                }
                .withDisabledSound(if: !isResetable)
            }
        }
    }
    
    func Theme() -> some View {
        ThreeButtonContainer {
            HStack {
                HelpColorButton("Orange", .orange)
                    .padding(.trailing, landscape || tablet ? 15 : 0)
                
                if !landscape && !tablet {
                    Spacer()
                }
                
                HelpColorButton("Green", .green)
                    .padding(.trailing, landscape || tablet ? 15 : 0)
                
                if !landscape && !tablet {
                    Spacer()
                }
                
                HelpColorButton("Blue", .blue)
            }
        }
    }
    
    func Difficulty() -> some View {
        ThreeButtonContainer {
            HStack {
                HelpRadioButton("easy", active: testVM.difficulty == .easy, fontSizeModifier: !landscape && !tablet ? -10 : 0) {
                    testVM.difficulty(.easy)
                    graphVM.generateTests()
                }
                .padding(.trailing, landscape || tablet ? 15 : 0)
                
                if !landscape && !tablet {
                    Spacer()
                }
                
                HelpRadioButton("medium", active: testVM.difficulty == .medium, fontSizeModifier: !landscape && !tablet ? -10 : 0) {
                    testVM.difficulty(.medium)
                    graphVM.generateTests()
                }
                .padding(.trailing, landscape || tablet ? 15 : 0)
                
                if !landscape && !tablet {
                    Spacer()
                }
                
                HelpRadioButton("hard", active: testVM.difficulty == .hard, fontSizeModifier: !landscape && !tablet ? -10 : 0) {
                    testVM.difficulty(.hard)
                    graphVM.generateTests()
                }
            }
        }
    }
    
    func NewGame() -> some View {
        func WarnText() -> some View {
            Text("Delete all progress and start again?")
                .font(SwiftUI.Font.of(props: themeVM.terminal.hli.select.button.font))
                .foregroundColor(themeVM.terminal.help.settings.active.color)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
        }
        
        func WarnButton() -> some View {
            HelpWarnButton("ok") {
                CmdDao.remove()
                testVM.reset()
                asciiVM.reset()
                chatVM.reset()
                helpVM.reset()
                themeVM.reset()
                graphVM.reset()
                withAnimation {
                    uiVM.reset()
                }
                uiVM.video = .intro
            }
        }
        
        return
            HStack {
                Spacer()
                ButtonContainer(padding: landscape ? 0 : 20, visible: !landscape) {
                    if landscape {
                        HStack {
                            WarnText()
                                .padding(.trailing, 20)
                                .offset(y: 5)
                            WarnButton()
                        }
                    } else {
                        VStack {
                            WarnText()
                            WarnButton()
                        }
                    }

                }
                Spacer()
            }
    }
    
    /*
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
     
     let isResetable = !themeVM.fontSize.isDefault()
     HelpRadioButton("reset", active: isResetable, sound: (on: .click, off: .click)) {
     if isResetable {
     themeVM.font(.reset)
     }
     }
     .withDisabledSound(if: !isResetable)
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
     CmdDao.remove()
     testVM.reset()
     asciiVM.reset()
     chatVM.reset()
     helpVM.reset()
     themeVM.reset()
     graphVM.reset()
     withAnimation {
     uiVM.reset()
     }
     uiVM.video = .intro
     }
     .padding(.bottom, 20)
     .padding(.top, 5)
     }
     }
     */
    
}
