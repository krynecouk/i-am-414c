//
//  TerminalCommandSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//

import SwiftUI

struct TerminalCommandSegue: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @EnvironmentObject var testVM: TestViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    @State var isOpen = false
    
    let headerH: CGFloat = 64
    
    var body: some View {
        if !uiVM.isDetail && !uiVM.isHelp {
            TerminalSegue(header: Header(), height: (header: headerH, content: keyboardVM.keyboardSize.height), isOpen: isOpen) {
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
            .onAppear {
                keyboardVM.close()
            }
            .onReceive(keyboardVM.$isOpen) { isOpen in
                self.isOpen = isOpen
            }
            .onReceive(keyboardVM.$keyboardSize) { value in
                keyboardVM.close()
            }
        }
    }
    
    func Header() -> some View {
        TerminalCommandLine()
            .onTapGesture {
                keyboardVM.isOpen
                    ? keyboardVM.close()
                    : keyboardVM.open()
            }
    }
}

struct TerminalCommandSegue_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandSegue()
    }
}
