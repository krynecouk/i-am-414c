//
//  TerminalDetailFooter.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 25.07.2021.
//

import SwiftUI

struct TerminalDetailFooter: View {
    @EnvironmentObject var uiVM: UIViewModel
    
    let modifier: Sound = Sound.of(.modifier)
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.black).edgesIgnoringSafeArea(.all)
            Text(uiVM.withHint ? "HIDE HINT" : "SHOW HINT")
                .foregroundColor(.white)
        }
        .frame(height: SegueViewModel.header.height)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .offset(y: 64)))
        .onTapGesture {
            withAnimation {
                uiVM.withHint.toggle()
            }
        }
    }
}
