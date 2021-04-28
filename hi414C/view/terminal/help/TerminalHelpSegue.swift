//
//  TerminalHelpSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 27.04.2021.
//
import SwiftUI

struct TerminalHelpSegue: View {
    @EnvironmentObject var segueVM: SegueViewModel
    
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
                    if opened != nil {
                        if opened == .help {
                            self.segueH = SegueViewModel.header.height + segueVM.help.height
                        } else {
                            self.segueH = SegueViewModel.header.height + segueVM.settings.height
                        }
                    } else {
                        self.segueH = SegueViewModel.header.height
                    }
                    
                }
            }
            .onReceive(segueVM.$help) { value in
                segueVM.close()
            }
            .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
        }
}
