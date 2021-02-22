//
//  A.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.02.2021.
//

import SwiftUI

struct A: View {
    
    let font = Font.custom(FontManager.ModernTerminus.terminus, size: 25)
    
    let lines = [
        " █████╗ ",
        "██╔══██╗",
        "███████║",
        "██╔══██║",
        "██║  ██║",
        "╚═╝  ╚═╝",
    ]

    let result: String

    init() {
        result = lines.joined(separator: "\n")
    }

    var body: some View {
        Text(result)
            .foregroundColor(Color("Primary"))
            .fixedSize()
            .lineLimit(7)
            .multilineTextAlignment(.leading)
            .font(font)
            .shadow(color: .yellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct A_Previews: PreviewProvider {
    static var previews: some View {
        A()
    }
}
