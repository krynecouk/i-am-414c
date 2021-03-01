//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @State var text: String = "this is some"
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                TerminalFont(">")
                TerminalFont(text)
                TerminalFont("█")
            }
        }
    }
}

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

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
                GeometryReader { metrics in
                    VStack {
                        Spacer()
                    TerminalView()
                        .frame(width: metrics.size.width, height: metrics.size.height * 0.6, alignment: .topLeading)
                    }
                }
        }
    }
}
