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
            TerminalHelpLine()
                .onTapGesture {
                    segueVM.close()
                }
            TerminalHelpSelect()
        }
        .frame(height: segueVM.segue.height)
        .onReceive(segueVM.$opened) { opened in
            withAnimation(Animation.easeOut.speed(2)) {
                segueVM.setSegueSize((.infinity, getSegueH(opened)))
            }
        }
        .onReceive(segueVM.$learn) { _ in
            segueVM.close()
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 64)))
    }
    
    func getSegueH(_ opened: SegueType?) -> CGFloat {
        switch opened {
        case .learn:
            return SegueViewModel.header.height + segueVM.learn.height
        case .chat:
            return SegueViewModel.header.height + segueVM.chat.height
        case .settings:
            return SegueViewModel.header.height + segueVM.settings.height
        default:
            return SegueViewModel.header.height
        }
    }
}
