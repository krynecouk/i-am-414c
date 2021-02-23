//
//  Figlet.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.02.2021.
//

import SwiftUI

struct Figlet: View {
    @State var print: String = ""
    @State var printIdx: Int = 0
    
    var key: String
    var lines: [String]
    var font: Font = Font.custom(FontManager.ModernTerminus.terminus, size: 25)
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    init(
        _ key: String,
        _ lines: [String],
        _ font: Font = Font.custom(FontManager.ModernTerminus.terminus, size: 25)) {
        
        self.key = key
        self.lines = lines
        self.font = font
        self.print = lines[0]
    }
    
    var body: some View {
        Text(print)
            .frame(width: 100, height: 190, alignment: .topLeading)
            .foregroundColor(Color("Primary"))
            .fixedSize()
            .multilineTextAlignment(.leading)
            .font(font)
            .shadow(color: Color("Primary"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { _ in
                if printIdx == lines.count {
                    self.timer.upstream.connect().cancel()
                    return
                }
                print += lines[printIdx] + "\n"
                printIdx += 1
            }

    }
}

struct Figlet_Previews: PreviewProvider {
    static var previews: some View {
        Figlet("A", [
            " █████╗ ",
            "██╔══██╗",
            "███████║",
            "██╔══██║",
            "██║  ██║",
            "╚═╝  ╚═╝",
        ])
    }
}
