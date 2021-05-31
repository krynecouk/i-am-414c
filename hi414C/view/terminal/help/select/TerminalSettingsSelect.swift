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
                SelectContainer {
                    HStack {
                        let isDecreasable = themeVM.fontSize.isDecreasable()
                        HelpRadioButton("-1", active: isDecreasable) {
                            if isDecreasable {
                                themeVM.font(.decrease)
                            }
                        }
                        .disabled(!isDecreasable)
                        .padding(.trailing, 20)
                        
                        let isIncreasable = themeVM.fontSize.isIncreasable()
                        HelpRadioButton("+1", active: isIncreasable) {
                            if isIncreasable {
                                themeVM.font(.increase)
                            }
                        }
                        .disabled(!isIncreasable)
                        .padding(.trailing, 20)
                        HelpButton("default") {
                            themeVM.font(.reset)
                        }
                    }
                }
            }
        }
        
        if helpVM.settings == .theme {
            Grid(columns: [GridItem(.adaptive(minimum: 110, maximum: .infinity))], spacing: 10, padding: 15) {
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
        }
        
        if helpVM.settings == .reset {
            SelectContainer {
                VStack {
                    WarnText("Can be unlocked after finishing the game.")
                        .padding(.bottom, 10)
                    HStack {
                        HelpRadioButton("easy", active: true)
                            .padding(.trailing, 20)
                        HelpRadioButton("medium", active: true)
                            .padding(.trailing, 20)
                        HelpRadioButton("hard", active: true)
                    }
                }
            }
        }
        
        if helpVM.settings == .delete {
            SelectContainer {
                VStack {
                    WarnText("Delete all progress and start again?")
                        .padding(.bottom, 10)
                    HelpWarnButton("ok") {
                        testVM.level(reset: true)
                        testVM.radix(of: .bin)
                        asciiVM.reset()
                        chatVM.clear()
                        helpVM.current = .learn
                        helpVM.settings = .font
                        helpVM.resetToZero()
                        themeVM.reset()
                        uiVM.current = .test
                        graphVM.setGraph(.BIN)
                        withAnimation {
                            uiVM.isHelp = false
                            uiVM.isIntroVideo = false // TODO true
                            uiVM.isIntro = true
                        }
                    }
                }
            }
        }
    }
    
    func WarnText(_ text: String) -> some View {
        //Group {
        //  Color.clear
        Text(text)
            .withTheme(themeVM.terminal.hli.button.active)
            .multilineTextAlignment(.center)
        //Color.clear
        //}
    }
}


struct SelectContainer<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { metrics in
            ScrollView(showsIndicators: false) {
                content
                    .padding(15)
                    .frame(width: metrics.size.width)
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
