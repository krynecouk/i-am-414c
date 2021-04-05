//
//  TerminalSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.04.2021.
//

import SwiftUI

struct TerminalSegue<Header: View, Content: View> : View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @State var segueH: CGFloat = 0
    @State var segueOpacity: Double = 0
    
    let header: Header
    let content: Content
    let headerH: CGFloat = 64
    
    init(header: Header, @ViewBuilder content: () -> Content) {
        self.header = header
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            header
                .onTapGesture {
                    keyboardVM.isOpen
                        ? keyboardVM.close()
                        : keyboardVM.open()
                }
            content
                .opacity(segueOpacity)
        }
        .frame(height: segueH)
        .id(keyboardVM.keyboardSize.height)
        .onAppear {
            keyboardVM.close()
            self.segueH = headerH
        }
        .onReceive(keyboardVM.$isOpen) { isOpen in
            withAnimation {
                self.segueH = isOpen ? self.headerH + keyboardVM.keyboardSize.height : self.headerH
            }
            
            withAnimation {
                self.segueOpacity = isOpen ? 1 : 0 // TODO make only keys opacity 0
            }
        }
    }
}
