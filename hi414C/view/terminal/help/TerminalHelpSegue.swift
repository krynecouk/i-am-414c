//
//  TerminalHelpSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//

import SwiftUI

struct TerminalHelpSegue: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    
    @State var segueH: CGFloat = 0
    let headerH: CGFloat = 64
    
    init() {
        print("TerminalHelpSegue")
    }
    
    var body: some View {
            VStack(spacing: 0) {
                TerminalCommandLine()
                    .onTapGesture {
                        keyboardVM.isOpen
                            ? keyboardVM.close()
                            : keyboardVM.open()
                    }
                ASCIIKeyboardView() { input in
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
