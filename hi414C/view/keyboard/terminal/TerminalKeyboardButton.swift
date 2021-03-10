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
    let isLandscape: Bool
    
    init(_ value: String, width: CGFloat = 40, isLandscape: Bool = false) {
        self.value = value
        self.width = width
        self.isLandscape = isLandscape
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0))
                .frame(width: self.width, height: isLandscape ? 30 : 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 9)
                        .stroke(Color("Primary"), lineWidth: 1)
                        .bloom()
                )
            TerminalText(value, size: 20)
        }
    }
}

struct TerminalKeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TerminalKeyboardButton("127")
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
                .previewDisplayName("Portrait")
            
            TerminalKeyboardButton("127", isLandscape: true)
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
                .previewDisplayName("Landscape")
        }

    }
}
