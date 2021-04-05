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
    @State var segueOpacity: CGFloat = 0
    
    // commandline
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
        }
        .frame(height: withAnimation {
            keyboardVM.isOpen ? headerH + keyboardVM.keyboardSize.height : headerH
        })
        .id(keyboardVM.keyboardSize.height)
        .onAppear {
            keyboardVM.close()
            self.segueH = headerH
        }
    }
}

/*
 struct TerminalSegue_Previews: PreviewProvider {
 static var previews: some View {
 TerminalSegue()
 }
 }
 */
