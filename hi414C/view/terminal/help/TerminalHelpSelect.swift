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
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 90, maximum: .infinity))]
    
    @State var offset: Offset = (0, 0)
    
    var body: some View {
        GeometryReader { metrics in
            Grid(columns: TerminalHelpSelect.ADAPTIVE) {
                if segueVM.opened == .help && uiVM.current == .message {
                    Group {
                        Button("History") {
                            helpVM.isHistory.toggle()
                            
                        }
                        Button("Rand") {
                            helpVM.randAnswer()
                        }
                    }
                }
                if segueVM.opened == .help && uiVM.current == .test {
                    Group {
                        Button("-1") {
                            helpVM.decrement()
                        }
                        Button("+1") {
                            helpVM.increment()
                        }
                        Button("Rand") {
                            helpVM.rand()
                        }
                        Button("Reset") {
                            helpVM.reset()
                        }
                        Button("0000") {
                            helpVM.resetToZero()
                        }
                    }
                    Group {
                        if testVM.radix == .hex {
                            Button("BIN") {
                                helpVM.radix(of: .hex)
                            }
                        }
                        if testVM.radix == .hex {
                            Button("HEX") {
                                helpVM.radix(of: .hex)
                            }
                        }


                        /*
                        Button("AND") {
                            helpVM.change(to: .AND)
                        }
                        
                        Button("OR") {
                            helpVM.change(to: .OR)
                        }
                        Button("XOR") {
                            helpVM.change(to: .XOR)
                        }
                        Button("NOT") {
                            helpVM.change(to: .NOT)
                        }
                        Button("SHL") {
                            helpVM.change(to: .SHL)
                        }
                        Button("SHR") {
                            helpVM.change(to: .SHR)
                        }
                        */
                    }
                    Group {
                        if testVM.level >= 3 {
                            Button("ADD") {
                                helpVM.change(to: .ADD)
                            }
                        }

                        if testVM.level >= 4 {
                            Button("SUB") {
                                helpVM.change(to: .SUB)
                            }
                        }

                        if testVM.level >= 5 {
                            Button("DIV") {
                                helpVM.change(to: .DIV)
                            }
                        }
                        
                        if testVM.level >= 6 {
                            Button("MUL") {
                                helpVM.change(to: .MUL)
                            }
                        }


                    }
                }
                
                if segueVM.opened == .settings {
                    Button("Reset") {
                        themeVM.reset()
                    }
                    Button("NewGame") {
                        graphVM.setGraph(root: Graphs.HI)
                        asciiVM.reset()
                    }
                    Button("Font-1") {
                        themeVM.font(FontTheme(
                            robot: FontProps(size: themeVM.theme.font.robot.size - 1), al: FontProps(name: .proggyTiny, size: themeVM.theme.font.al.size - 5)
                        ))
                    }
                    Button("Font+1") {
                        themeVM.font(FontTheme(
                            robot: FontProps(size: themeVM.theme.font.robot.size + 1), al: FontProps(name: .proggyTiny, size: themeVM.theme.font.al.size + 5)
                        ))
                    }
                }
                
                if segueVM.opened == .themes {
                    Button("orange") {
                        themeVM.change(to: .orange)
                    }
                    Button("green") {
                        themeVM.change(to: .green)
                    }
                    Button("blue") {
                        themeVM.change(to: .blue)
                    }
                    Button("lorange") {
                        themeVM.change(to: .light_orange)
                    }
                    Button("lgreen") {
                        themeVM.change(to: .light_green)
                    }
                    Button("lblue") {
                        themeVM.change(to: .light_blue)
                    }
                    Button("greengold") {
                        themeVM.change(to: .green_gold)
                    }
                }
            }
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                if frameW > 500 {
                    segueVM.setHelpSize((.infinity, 150))
                    segueVM.setSettingsSize((.infinity, 140))
                    segueVM.setThemesSize((.infinity, 100))
                } else {
                    segueVM.setHelpSize((.infinity, 150))
                    segueVM.setSettingsSize((.infinity, 140))
                    segueVM.setThemesSize((.infinity, 100))
                }
            }
            .onReceive(segueVM.$isOpen) { isOpen in
                withAnimation {
                    self.offset = isOpen ? (0,0) : (0, 100)
                }
            }
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(themeVM.terminal.hli.background), alignment: .top)
        }
        //.frame(maxWidth: self.size.width, maxHeight: self.size.height)
        .background(segueVM.isOpen && segueVM.opened != .keyboard
                        ? themeVM.terminal.hli.select.background.active.edgesIgnoringSafeArea(.all)
                        : themeVM.terminal.hli.select.background.passive.edgesIgnoringSafeArea(.all))
    }
    
    func Button(_ text: String, perform action: @escaping () -> Void = {}) -> some View {
        Text(text)
            .padding()
            .withTheme(themeVM.terminal.hli.select.button)
            .offset(x: self.offset.x, y: self.offset.y)
            .onTapGesture {
                action()
            }
    }
    
    func RadioButton(_ text: String, perform action: @escaping () -> Void = {}) -> some View {
        Text(text)
            .padding()
            .withTheme(themeVM.terminal.hli.select.button)
            .offset(x: self.offset.x, y: self.offset.y)
            .onTapGesture {
                action()
            }
    }
}


