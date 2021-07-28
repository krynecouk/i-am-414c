//
//  TerminalHelpSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//
import SwiftUI

struct TerminalHelpSegue: View {
    @EnvironmentObject var segueVM: SegueViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            TerminalHelpSelect()
            TerminalHelpLine()
                .onTapGesture {
                    segueVM.close()
                }
        }
        .frame(height: segueVM.segue.height)
        .onReceive(segueVM.$opened) { opened in
            if opened == .chat {
                segueVM.setSegueSize(SegueViewModel.header)
            }
            withAnimation(Animation.easeOut.speed(2)) {
                segueVM.setSegueSize(segueVM.help)
            }
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 64)))
    }
}
