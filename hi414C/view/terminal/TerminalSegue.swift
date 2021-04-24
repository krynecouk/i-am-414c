//
//  TerminalSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.04.2021.
//

import SwiftUI

struct TerminalSegue: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var terminalVM: TerminalViewModel
    
    @State var segueH: CGFloat = 0
    let headerH: CGFloat = 64
    
    init() {
        print("TerminalSegue")
    }
    
    var body: some View {
        if !uiVM.isDetail {
            VStack(spacing: 0) {
                TerminalCommandLine()
                    .onTapGesture {
                        keyboardVM.isOpen
                            ? keyboardVM.close()
                            : keyboardVM.open()
                    }
                ASCIIKeyboardView() { input in
                    if input == "?" {
                        withAnimation {
                            uiVM.isHelp = uiVM.isHelp ? false : true
                        }
                        return
                    }
                    if (testVM.test != nil) {
                        let solution = testVM.solve(with: input)
                        switch solution {
                        case .right:
                            asciiVM.add(symbol: testVM.test!.symbol)
                        default:
                            print("not correct")
                        }
                    } else {
                        graphVM.traverse(ctx: GraphContext(input: input))
                    }
                }
            }
            .frame(height: segueH)
            .onAppear {
                keyboardVM.close()
                self.segueH = headerH
            }
            .onReceive(keyboardVM.$isOpen) { isOpen in
                withAnimation {
                    self.segueH = isOpen ? self.headerH + keyboardVM.keyboardSize.height : self.headerH
                }
            }
            .onReceive(keyboardVM.$keyboardSize) { value in
                keyboardVM.close()
            }
            .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
        }
    }
}
