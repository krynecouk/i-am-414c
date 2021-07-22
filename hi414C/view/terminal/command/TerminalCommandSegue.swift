//
//  TerminalCommandSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.04.2021.
//
import SwiftUI

struct TerminalCommandSegue: View {
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var terminalVM: TerminalViewModel
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var segueVM: SegueViewModel
    
    let modifier: Sound = Sound.of(.modifier)
    let discover: Sound = Sound.of(.discover)
    
    var body: some View {
        VStack(spacing: 0) {
            TerminalCommandLine()
                .onTapGesture {
                    if !uiVM.isWaiting {
                        segueVM.isOpen
                            ? segueVM.close()
                            : segueVM.open()
                    }
                }
            ASCIIKeyboardView(predictive: testVM.test == nil) { input in
                if input == "?" {
                    withAnimation {
                        uiVM.isHelp = uiVM.isHelp ? false : true
                    }
                    modifier.play()
                    return
                }
                if (testVM.test != nil) {
                    let solution = testVM.solve(with: input)
                    switch solution {
                    case .right:
                        discover.play()
                        asciiVM.add(symbol: testVM.test!.symbol)
                    case .wrong(_):
                        uiVM.shake()
                    case .none:
                        print("No test provided")
                    }
                } else {
                    uiVM.isWaiting = true
                    graphVM.traverse(ctx: GraphContext(input: input)) { result in
                        switch result {
                        case .ok:
                            modifier.play()
                            uiVM.isWaiting = false
                        case .error(_):
                            uiVM.shake()
                            uiVM.isWaiting = false
                        }
                    }
                }
            }
        }
        .onAppear {
            segueVM.setSegueSize((.infinity, SegueViewModel.header.height))
        }
        .frame(height: segueVM.segue.height)
        .onReceive(segueVM.$isOpen) { isOpen in
            withAnimation {
                let keyboardH = testVM.test == nil ? segueVM.keyboard.height : segueVM.keyboard.height - 64
                let segueH = isOpen ? SegueViewModel.header.height + keyboardH : SegueViewModel.header.height
                segueVM.setSegueSize((.infinity, segueH))
            }
        }
        .onReceive(segueVM.$keyboard) { value in
            segueVM.close()
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
    }
}
