//
//  TerminalFont.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 02.03.2021.
//

import SwiftUI

struct TerminalFont: View {
    let content: String
    
    init(_ content: String) {
        self.content = content
    }
    
    var body: some View {
        Text(content)
            .foregroundColor(Color("Primary"))
            .fixedSize()
            .font(Font.custom(FontName.terminus.rawValue, size: 25))
            .shadow(color: Color("Primary"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
    }
}

struct TerminalFont_Previews: PreviewProvider {
    static var previews: some View {
        TerminalFont("> this is test of terminal font █")
    }
}
