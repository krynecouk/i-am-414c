//
//  TerminalCommandPrompt.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalCommandPrompt: View {
    @State var visible = false
    
    var settings = ViewSettings(
        font: (.terminus, 33),
        color: Color("Primary")
    )
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text("█")
            .opacity(visible ? 1 : 0)
            .animation(Animation.easeInOut(duration: 0.3).speed(0.75))
            .withSettings(settings)
            .bloom()
            .onReceive(timer) { _ in
                self.visible.toggle()
            }
    }
}

struct TerminalCommandPrompt_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandPrompt()
    }
}
