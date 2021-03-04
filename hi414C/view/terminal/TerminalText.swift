//
//  TerminalText.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 02.03.2021.
//

import SwiftUI

struct TerminalText: View {
    let content: String
    let color: Color
    let shadowColor: Color
    let size: CGFloat
    
    init(
        _ content: String,
        color: Color = Color("Primary"),
        shadowColor: Color = Color("Primary"),
        size: CGFloat = 25
    ) {
        
        self.content = content
        self.color = color
        self.shadowColor = shadowColor
        self.size = size
    }
    
    var body: some View {
        Text(content)
            .foregroundColor(color)
            .fixedSize()
            .font(Font.custom(FontName.terminus.rawValue, size: size))
            .shadow(color: shadowColor, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct TerminalText_Previews: PreviewProvider {
    static var previews: some View {
        TerminalText("> this is test of terminal font █")
    }
}
