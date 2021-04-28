//
//  TerminalHelpSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//
import SwiftUI

struct TerminalHelpSegue: View {
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    
    @State var segueH: CGFloat = 0
    let headerH: CGFloat = 64
    
    init() {
        print("TerminalHelpSegue")
    }
    
    var body: some View {
            VStack(spacing: 0) {
                TerminalHelpLine()
                    .onTapGesture {
                        segueVM.isOpen
                            ? segueVM.close()
                            : segueVM.open()
                    }
                TerminalHelpSelect()
            }
            .frame(height: segueH)
            .onAppear {
                segueVM.close()
                self.segueH = headerH
            }
            .onReceive(segueVM.$isOpen) { isOpen in
                withAnimation {
                    self.segueH = isOpen ? self.headerH + keyboardVM.keyboardSize.height : self.headerH
                }
            }
            .onReceive(keyboardVM.$keyboardSize) { value in
                segueVM.close()
            }
            .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
        }
}
