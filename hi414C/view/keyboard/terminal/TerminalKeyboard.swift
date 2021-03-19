//
//  TerminalKeyboard.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.03.2021.
//

import SwiftUI

struct TerminalKeyboard: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    
    @State var side: Side = .ALPH
    
    enum Side {
        case ALPH, SYMBOL
    }

    var body: some View {
        GeometryReader { metrics in
            VStack {
                if side == .ALPH {
                    HStack(alignment: .center, spacing: 8) {
                        TerminalKey("Q", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "Q")
                            }
                        TerminalKey("W", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "W")
                            }
                        TerminalKey("E", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "E")
                            }
                        TerminalKey("R", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "R")
                            }
                        TerminalKey("T", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "T")
                            }
                        TerminalKey("Y", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "Y")
                            }
                        TerminalKey("U", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "U")
                            }
                        TerminalKey("I", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "I")
                            }
                        TerminalKey("O", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "O")
                            }
                        TerminalKey("P", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "P")
                            }
                    }
                    HStack(spacing: 8) {
                        TerminalKey("A", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "A")
                            }
                        TerminalKey("S", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "S")
                            }
                        TerminalKey("D", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "D")
                            }
                        TerminalKey("F", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "F")
                            }
                        TerminalKey("G", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "G")
                            }
                        TerminalKey("H", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "H")
                            }
                        TerminalKey("J", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "J")
                            }
                        TerminalKey("K", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "K")
                            }
                        TerminalKey("L", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "L")
                            }
                    }
                    HStack(spacing: 8) {
                        TerminalKey("Z", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "Z")
                            }
                        TerminalKey("X", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "X")
                            }
                        TerminalKey("C", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "C")
                            }
                        TerminalKey("V", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "V")
                            }
                        TerminalKey("B", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "B")
                            }
                        TerminalKey("N", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "N")
                            }
                        TerminalKey("M", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "M")
                            }
                        TerminalKey("DEL", metrics: metrics)
                            .onTapGesture {
                                keyboardVM.currentValue = ""
                            }
                    }
                    HStack(spacing: 8) {
                        TerminalKey("123", metrics: metrics)
                            .onTapGesture {
                                self.side = .SYMBOL
                            }
                        TerminalKeyboardButton("SPACE", width: (metrics.size.width - metrics.size.width / 10 - metrics.size.width / 10) - 16)
                        TerminalKey("ENT", metrics: metrics)
                            .onTapGesture {
                                if (TestViewModel.current != nil) {
                                    let solution = TestViewModel.current?.solve(with: keyboardVM.currentValue)
                                    switch solution {
                                    case .right:
                                        asciiVM.add(symbol: TestViewModel.current!.symbol)
                                    default:
                                        print("not correct")
                                    }
                                } else {
                                    graphVM.process(ctx: Context(input: keyboardVM.currentValue))
                                }
                                keyboardVM.currentValue = ""
                            }
                    }
                } else {
                    HStack(alignment: .center, spacing: 8) {
                        TerminalKey("1", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "1")
                            }
                        TerminalKey("2", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "2")
                            }
                        TerminalKey("3", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "3")
                            }
                        TerminalKey("4", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "4")
                            }
                        TerminalKey("5", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "5")
                            }
                        TerminalKey("6", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "6")
                            }
                        TerminalKey("7", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "7")
                            }
                        TerminalKey("8", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "8")
                            }
                        TerminalKey("9", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "9")
                            }
                        TerminalKey("0", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "0")
                            }
                    }
                    HStack(spacing: 8) {
                        TerminalKey("123", metrics: metrics)
                            .onTapGesture {
                                self.side = .ALPH
                            }
                        TerminalKey("?", metrics: metrics)
                            .onTapGesture {
                                updateInput(value: "?")
                            }
                    }
                }
                
            }
        }
    }

    func updateInput(value: String) {
        keyboardVM.currentValue += value
    }
}

struct TerminalKey: View {
    let metrics: GeometryProxy
    let value: String

    init(_ value: String, metrics: GeometryProxy) {
        self.value = value
        self.metrics = metrics
    }

    var body: some View {
        TerminalKeyboardButton(self.value, width: (self.metrics.size.width - 80) / 10)
    }
}

struct TerminalKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            VStack {
                Spacer()
                TerminalKeyboard()
                    .frame(height: 300)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
            .withEnvironment()
        }
    }
}
