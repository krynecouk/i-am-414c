//
//  TerminalSegue.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.04.2021.
//

import SwiftUI

struct TerminalSegue<Header: View, Content: View> : View {
    let header: Header
    let content: Content
    let height: (header: CGFloat, content: CGFloat)
    let isOpen: Bool
    
    @State var segueH: CGFloat = 0
    
    init(header: Header, height: (CGFloat, CGFloat), isOpen: Bool = false, @ViewBuilder content: () -> Content) {
        print("TerminalSegue")
        self.header = header
        self.height = height
        self.isOpen = isOpen
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            header
            content
        }
        .onAppear {
            self.segueH = height.header
        }
        .onChange(of: self.isOpen) { isOpen in
            withAnimation {
                self.segueH = isOpen ? self.height.header + self.height.content : self.height.header
            }
        }
        .frame(height: segueH)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 60)))
    }
}
