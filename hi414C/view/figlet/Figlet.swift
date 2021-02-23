//
//  Figlet.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.02.2021.
//

import SwiftUI

struct Figlet: View {
    var key: String
    var lines: [String]
    var font: Font = Font.custom(FontManager.ModernTerminus.terminus, size: 25)
    
    init(
        _ key: String,
        _ lines: [String],
        _ font: Font = Font.custom(FontManager.ModernTerminus.terminus, size: 25)) {
        self.key = key
        self.lines = lines
        self.font = font
    }
    
    var body: some View {
        Text(lines.joined(separator: "\n"))
            .foregroundColor(Color("Primary"))
            .fixedSize()
            .multilineTextAlignment(.leading)
            .font(font)
            .shadow(color: Color("Primary"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
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