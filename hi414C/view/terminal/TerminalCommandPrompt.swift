//
//  TerminalCommandPrompt.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalCommandPrompt: View {
    @State var visible = true
    
    var theme = ViewTheme(
        color: Color("Primary")
    )
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Rectangle()
            .fill(Color("Primary"))
            .opacity(visible ? 1 : 0)
            .frame(width: 20.5, height: 34.5, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .withTheme(theme)
            .onReceive(timer) { _ in
               withAnimation {
                    self.visible.toggle()
               }
            }
    }
}

struct TerminalCommandPrompt_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandPrompt()
    }
}
