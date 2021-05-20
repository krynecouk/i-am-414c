//
//  TerminalHelpSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 28.04.2021.
//

import SwiftUI

struct TerminalHelpSelect: View {
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 100, maximum: .infinity))]
        
    var body: some View {
        GeometryReader { metrics in
            Grid(columns: TerminalHelpSelect.ADAPTIVE, spacing: 10, padding: 15) {
                if segueVM.opened == .help && uiVM.current == .message {
                    Group {
                        HelpButton("History") {
                            helpVM.isHistory.toggle()
                            
                        }
                        HelpButton("rnd") {
                            helpVM.randAnswer()
                        }
                    }
                }
                if segueVM.opened == .help && uiVM.current == .test {
                    Group {
                        HelpButton("-1") {
                            helpVM.decrement()
                        }
                        HelpButton("+1") {
                            helpVM.increment()
                        }
                        HelpButton("rnd") {
                            helpVM.rand()
                        }
                        HelpButton("000") {
                            helpVM.resetToZero()
                        }
                    }
                    Group {
                        HelpButton(helpVM.radix == .bin ? "hex" : "bin") {
                            helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
                        }
                    }
                    Group {
                        HelpSignButton("=", ID.self, .ID)
                        HelpSignButton("+", ADD.self, .ADD)
                        HelpSignButton("-", SUB.self, .SUB)
                        HelpSignButton("/", DIV.self, .DIV)
                        HelpSignButton("*", MUL.self, .MUL)
                    }
                    Group{
                        HelpSignButton("&", AND.self, .AND)
                        HelpSignButton("|", OR.self, .OR)
                        HelpSignButton("^", XOR.self, .XOR)
                        HelpSignButton("~", NOT.self, .NOT)
                        HelpSignButton("<<", SHL.self, .SHL)
                        HelpSignButton(">>", SHR.self, .SHR)
                    }
                }
                
                if segueVM.opened == .settings {
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
                    
                    HelpButton("newGame") {
                        graphVM.setGraph(root: Graphs.HI)
                        asciiVM.reset()
                        uiVM.current = .test
                    }
                }
                
                if segueVM.opened == .themes {
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
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                if frameW > 500 {
                    segueVM.setHelpSize((.infinity, 150))
                    segueVM.setSettingsSize((.infinity, 150))
                    segueVM.setThemesSize((.infinity, 150))
                } else {
                    segueVM.setHelpSize((.infinity, 210))
                    segueVM.setSettingsSize((.infinity, 140))
                    segueVM.setThemesSize((.infinity, 300))
                }
            }
            .background(segueVM.isOpen && segueVM.opened != .keyboard
                            ? themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all)
                            : themeVM.terminal.hli.select.background.passive.edgesIgnoringSafeArea(.all))
        }
    }

    func HelpSignButton<T>(_ text: String, _ type: T.Type, _ equationType: EquationType) -> some View {
        HelpRadioButton(text, active: helpVM.getBuilder(helpVM.equation) is T) {
            helpVM.change(to: equationType)
        }
    }
    
    func HelpColorButton(_ name: String, _ theme: ThemeType) -> some View {
        ColorButton(size: (70, 70), left: Color.primary(name), right: Color.secondary(name)) {
            themeVM.change(to: theme)
        }
        .border(Color.tertiary(name), width: 15)
        //.border(Color.secondary(name), width: 1)
        .padding(5)
        .border(themeVM.theme.type == theme ? Color.primary(name) : Color.clear, width: 5)
    }
    
    func HelpButton(_ text: String, perform action: @escaping () -> Void = {}) -> some View {
        Button(action: action) {
            Text(text)
                .padding()
                .withTheme(themeVM.terminal.hli.select.button)
        }
    }
    
    func HelpRadioButton(_ text: String, active: Bool = false, perform action: @escaping () -> Void = {}) -> some View {
        Button(action: action) {
            Text(text)
                .padding()
                .background(active ? themeVM.terminal.hli.select.button.background : themeVM.terminal.hli.button.passive.color.opacity(0.6))
                .font(Font.of(props: themeVM.terminal.hli.select.button.font))
                .foregroundColor(themeVM.terminal.hli.select.button.color.opacity(active ? 1 : 0.5))
        }
    }
}
