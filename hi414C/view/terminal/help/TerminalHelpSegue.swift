//
//  TerminalHelpSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//
import SwiftUI

struct TerminalHelpSegue: View {
    @EnvironmentObject var segueVM: SegueViewModel
    
    init() {
        print("TerminalHelpSegue")
    }
    
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
          //  withAnimation {
                segueVM.setSegueSize((.infinity, getSegueH(opened)))
          //  }
        }
        //.transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
    }
    
    func getSegueH(_ opened: SegueType?) -> CGFloat {
        switch opened {
        case .help:
            return SegueViewModel.header.height + segueVM.help.height
        case .settings:
            return SegueViewModel.header.height + segueVM.settings.height
        case .themes:
            return SegueViewModel.header.height + segueVM.themes.height
        default:
            return SegueViewModel.header.height
        }
    }
}
