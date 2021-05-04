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
    
    private static let ADAPTIVE = [GridItem(.adaptive(minimum: 90, maximum: .infinity))]
    
    @State var offset: Offset = (0, 0)
    
    var body: some View {
        GeometryReader { metrics in
            Grid(columns: TerminalHelpSelect.ADAPTIVE) {
                if segueVM.opened == .help && helpVM.current == .message {
                    Group {
                        Button("History") {
                            helpVM.isHistory.toggle()
                        }
                        Button("Rand") {
                            helpVM.randAnswer()
                        }
                    }
                }
                if segueVM.opened == .help && helpVM.current == .test {
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
                        Button("AND") {
                            helpVM.changeTo(type: .AND)
                        }
                        Button("OR") {
                            helpVM.changeTo(type: .OR)
                        }
                        Button("XOR") {
                            helpVM.changeTo(type: .XOR)
                        }
                        Button("NOT") {
                            helpVM.changeTo(type: .NOT)
                        }
                        Button("SHL") {
                            helpVM.changeTo(type: .SHL)
                        }
                        Button("SHR") {
                            helpVM.changeTo(type: .SHR)
                        }
                    }
                    Group {
                        Button("ADD") {
                            helpVM.changeTo(type: .ADD)
                        }
                        Button("SUB") {
                            helpVM.changeTo(type: .SUB)
                        }
                        Button("DIV") {
                            helpVM.changeTo(type: .DIV)
                        }
                        Button("MUL") {
                            helpVM.changeTo(type: .MUL)
                        }
                    }
                }
                
                if segueVM.opened == .settings {
                    Button("easy")
                    Button("medium")
                    Button("hard")
                }

                if segueVM.opened == .themes {
                    Button("orange")
                    Button("blue")
                    Button("green")
                }
            }
            .id(metrics.frame(in: .global).size.width)
            .onAppear {
                let frame = metrics.frame(in: .global)
                let frameW = frame.size.width
                if frameW > 500 {
                    segueVM.setHelpSize((.infinity, 150))
                    segueVM.setSettingsSize((.infinity, 70))
                    segueVM.setThemesSize((.infinity, 70))
                } else {
                    segueVM.setHelpSize((.infinity, 150))
                    segueVM.setSettingsSize((.infinity, 70))
                    segueVM.setThemesSize((.infinity, 70))
                }
            }
            .onReceive(segueVM.$isOpen) { isOpen in
                withAnimation {
                    self.offset = isOpen ? (0,0) : (0, 100)
                }
            }
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


