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
    
    @State var offset: Offset = (0, 0)
    
    var body: some View {
        GeometryReader { metrics in
            Grid(columns: TerminalHelpSelect.ADAPTIVE) {
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
                        BinHexButton()
                    }
                    Group {
                        HelpButton("=") {
                            helpVM.change(to: .ID)
                        }
                        
                        HelpButton("+") {
                            helpVM.change(to: .ADD)
                        }
                        
                        HelpButton("-") {
                            helpVM.change(to: .SUB)
                        }
                        
                        HelpButton("/") {
                            helpVM.change(to: .DIV)
                        }
                        
                        HelpButton("*") {
                            helpVM.change(to: .MUL)
                        }
                    }
                    Group{
                        HelpButton("&") {
                            helpVM.change(to: .AND)
                        }
                        
                        HelpButton("|") {
                            helpVM.change(to: .OR)
                        }
                        HelpButton("^") {
                            helpVM.change(to: .XOR)
                        }
                        HelpButton("~") {
                            helpVM.change(to: .NOT)
                        }
                        HelpButton("<<") {
                            helpVM.change(to: .SHL)
                        }
                        HelpButton(">>") {
                            helpVM.change(to: .SHR)
                        }
                        
                    }

                }
                
                if segueVM.opened == .settings {
                    HelpButton("font-1") {
                        themeVM.font(FontTheme(
                            robot: FontProps(size: themeVM.theme.font.robot.size - 1), al: FontProps(name: .proggyTiny, size: themeVM.theme.font.al.size - 5)
                        ))
                    }
                    HelpButton("font+1") {
                        themeVM.font(FontTheme(
                            robot: FontProps(size: themeVM.theme.font.robot.size + 1), al: FontProps(name: .proggyTiny, size: themeVM.theme.font.al.size + 5)
                        ))
                    }
                    HelpButton("font=0") {
                        themeVM.reset()
                    }
                    HelpRadioButton("Hint") {
                        themeVM.reset()
                    }
                    HelpButton("NewGame") {
                        graphVM.setGraph(root: Graphs.HI)
                        asciiVM.reset()
                    }

                }
                
                if segueVM.opened == .themes {
                    Group {
                        HelpButton("orange") {
                            themeVM.change(to: .orange)
                        }
                        HelpButton("green") {
                            themeVM.change(to: .green)
                        }
                        HelpButton("blue") {
                            themeVM.change(to: .blue)
                        }
                        HelpButton("lorange") {
                            themeVM.change(to: .light_orange)
                        }
                        HelpButton("lgreen") {
                            themeVM.change(to: .light_green)
                        }
                        HelpButton("lblue") {
                            themeVM.change(to: .light_blue)
                        }
                    }
                    
                    Group {
                        HelpButton("orangina") {
                            themeVM.change(to: .orangina)
                        }
                        HelpButton("forest") {
                            themeVM.change(to: .forest)
                        }
                        HelpButton("ice") {
                            themeVM.change(to: .ice)
                        }
                    }
                    
                    Group {
                        HelpButton("swamp") {
                            themeVM.change(to: .swamp)
                        }
                        HelpButton("bananaSky") {
                            themeVM.change(to: .bananaSky)
                        }
                        HelpButton("vintage") {
                            themeVM.change(to: .vintage)
                        }
                        HelpButton("pastel") {
                            themeVM.change(to: .pastel)
                        }
                        HelpButton("sunset") {
                            themeVM.change(to: .sunset)
                        }
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
            .onReceive(segueVM.$isOpen) { isOpen in
                withAnimation {
                    self.offset = isOpen ? (0,0) : (0, 100)
                }
            }
            .background(segueVM.isOpen && segueVM.opened != .keyboard
                            ? themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all)
                            : themeVM.terminal.hli.select.background.passive.edgesIgnoringSafeArea(.all))
        }
    }
    
    func Border() -> some View {
        Rectangle()
            .frame(width: nil, height: 5, alignment: .top)
            .foregroundColor(themeVM.terminal.hli.select.background.active)
        
    }
    
    func HelpButton(_ text: String, perform action: @escaping () -> Void = {}) -> some View {
        Button(action: action) {
            Text(text)
                .padding()
                .withTheme(themeVM.terminal.hli.select.button)
        }
        .offset(x: self.offset.x, y: self.offset.y)
    }
    
    @Namespace private var ns

    
    func BinHexButton() -> some View {
        Button(action: {
            withAnimation() {
                helpVM.radix(of: helpVM.radix == .bin ? .hex : .bin)
            }
        }) {
            HStack(spacing: 0) {
                Text("0b")
                    .padding()
                    .background(helpVM.radix == .bin ? themeVM.terminal.hli.select.button.background.matchedGeometryEffect(id: "radix", in: ns) : nil)
                    .background(Color.gray)
                    .withTheme(themeVM.terminal.hli.select.button)
                
                Text("0x")
                    .padding()
                    .background(helpVM.radix == .hex ? themeVM.terminal.hli.select.button.background.matchedGeometryEffect(id: "radix", in: ns) : nil)
                    .background(Color.gray)
                    .withTheme(themeVM.terminal.hli.select.button)
            }
            //.padding()
        }
        .offset(x: self.offset.x, y: self.offset.y)
    }
    
    func HelpRadioButton(_ text: String, active: Bool = false, perform action: @escaping () -> Void = {}) -> some View {
        Button(action: action) {
            Text(text)
                .padding()
                .background(active ? Color.blue : Color.gray)
                .withTheme(themeVM.terminal.hli.select.button)
                .offset(x: self.offset.x, y: self.offset.y)
        }
        .border(active ? Color.blue : Color.clear, width: 3)
    }
}


