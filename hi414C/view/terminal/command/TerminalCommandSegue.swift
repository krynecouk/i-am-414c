//
//  TerminalCommandSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.04.2021.
//
import SwiftUI

struct TerminalCommandSegue: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var terminalVM: TerminalViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var segueVM: SegueViewModel
    
    @State var segueH: CGFloat = SegueViewModel.header.height
    
    init() {
        print("TerminalSegue")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TerminalCommandLine()
                .onTapGesture {
                    segueVM.isOpen
                        ? segueVM.close()
                        : segueVM.open()
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
            segueVM.close()
        }
        .onReceive(segueVM.$isOpen) { isOpen in
            withAnimation {
                self.segueH = isOpen ? SegueViewModel.header.height + keyboardVM.keyboardSize.height : SegueViewModel.header.height
            }
        }
        .onReceive(keyboardVM.$keyboardSize) { value in
            segueVM.close()
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
    }
}
