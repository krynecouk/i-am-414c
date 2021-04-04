//
//  TerminalSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.04.2021.
//

import SwiftUI

struct TerminalSegue<Header: View, Content: View> : View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    @State var height: CGFloat = 0
    
    let header: Header
    let content: Content
    
    init(header: Header, @ViewBuilder content: () -> Content) {
        self.header = header
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            header
                .onTapGesture {
                    if keyboardVM.isOpen {
                        keyboardVM.isOpen = false
                    } else {
                        keyboardVM.isOpen = true
                    }
                }
            
            content
        }
        .animation(.spring())
        .frame(height: keyboardVM.isOpen ? 60 + keyboardVM.keyboardSize.height : 60)
        .onAppear {
            print("is open: \(keyboardVM.isOpen)")
            withAnimation(Animation.spring()) {
                keyboardVM.isOpen = false
                self.height = 60
            }
        }
        .id(keyboardVM.keyboardSize.height)
    }
}

/*
 struct TerminalSegue_Previews: PreviewProvider {
 static var previews: some View {
 TerminalSegue()
 }
 }
 */
