//
//  TerminalButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 04.03.2021.
//

import SwiftUI

struct TerminalButton: View {
    
    let text: String
    let label: String?
    
    init(_ text: String, label: String? = .none) {
        self.text = text
        self.label = label
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0.15))
                .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            
            TerminalText(text, size: 33)
            if let label = label {
                TerminalText(label,color: Color.gray, size: 16)
                    .padding(3)
                    .frame(width: 60, height: 60, alignment: .bottomTrailing)
            }
        }
    }
}

struct TerminalButton_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalButton("A", label: "65")
        }
    }
}
