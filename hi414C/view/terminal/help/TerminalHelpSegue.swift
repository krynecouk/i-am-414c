//
//  TerminalHelpSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//
import SwiftUI

struct TerminalHelpSegue: View {
    @EnvironmentObject var segueVM: SegueViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    @State var segueH: CGFloat = SegueViewModel.header.height
    
    init() {
        print("TerminalHelpSegue")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TerminalHelpLine()
            TerminalHelpSelect()
        }
        .frame(height: segueH)
        .onAppear {
            segueVM.close()
        }
        .onReceive(segueVM.$opened) { opened in
            withAnimation {
                self.segueH = getSegueH(opened)
            }
        }
        .onReceive(segueVM.$help) { value in
            segueVM.close()
        }
        .onReceive(uiVM.$isDetail) { isDetail in
            withAnimation {
                segueVM.close()
            }
        }
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
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
