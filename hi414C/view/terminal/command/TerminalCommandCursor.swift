//
//  TerminalCommandCursor.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 03.04.2021.
//

import SwiftUI

struct TerminalCommandCursor: View {
    @State var visible: Bool
    
    var theme: TerminalTheme.CommandLine.Cursor
    var timer: TimerPublisher
    var animation: Animation?
    var size: Size
    
    init(theme: TerminalTheme.CommandLine.Cursor, size: Size = (20.5, 34), initVisible: Bool = true) {
        self.theme = theme
        self.timer = Timer.publish(every: theme.blink.speed, on: .main, in: .common).autoconnect()
        self.animation = theme.blink.animation
        self.size = size
        self.visible = initVisible
    }
    
    var body: some View {
        Rectangle()
            .fill(theme.view.background!)
            .opacity(visible ? 1 : 0)
            .frame(width: size.width, height: size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { _ in
                withAnimation(self.animation) {
                    self.visible.toggle()
                }
            }
    }
}

struct TerminalCommandLineCursor_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandCursor(theme: TerminalTheme.CommandLine.Cursor(
            view: ViewTheme(),
            blink: (1, .linear)
        ))
    }
}
