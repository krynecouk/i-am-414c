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
                        Sound.play(.high)
                        asciiVM.add(symbol: testVM.test!.symbol)
                    case .wrong(_):
                        uiVM.shake()
                    case .none:
                        print("No test provided")
                    }
                } else {
                    graphVM.traverse(ctx: GraphContext(input: input)) { result in
                        switch result {
                        case .ok:
                            Sound.play(.modifier)
                        case .error(_):
                            uiVM.shake()
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
                let segueH = isOpen ? SegueViewModel.header.height + segueVM.keyboard.height : SegueViewModel.header.height
                segueVM.setSegueSize((.infinity, segueH))
            }
        }
        .onReceive(segueVM.$keyboard) { value in
            segueVM.close()
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
    }
}
