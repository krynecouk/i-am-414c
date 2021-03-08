//
//  TerminalKeyboardButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.03.2021.
//

import SwiftUI

struct TerminalKeyboardButton: View {
    
    let value: String
    let width: CGFloat
    
    init(_ value: String, width: CGFloat = 40) {
        self.value = value
        self.width = width
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0))
                .frame(width: self.width, height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color("Primary"), lineWidth: 2)
                )
                .shadow(color: Color("Primary"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            
            TerminalText(value, size: 20)
        }
    }
}

struct TerminalKeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        TerminalKeyboardButton("127")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
