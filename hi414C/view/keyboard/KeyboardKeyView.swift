//
//  KeyboardKeyView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 26.03.2021.
//

import SwiftUI

struct KeyboardKeyView: View {
    var label: String
    var value: String
    var onClick: (String) -> Void
    var width: CGFloat
    var height: CGFloat
    
    init(_ label: String, value: String? = nil, width: CGFloat, height: CGFloat, onClick: @escaping (String) -> Void = { _ in }) {
        self.label = label
        self.value = value ?? label
        self.width = width
        self.height = height
        self.onClick = onClick
    }
    
    var body: some View {
        Button(action: {
            onClick(value)
        }) {
            Text(label)
        }
        .frame(width: self.width, height: self.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.red)
    }
}

struct KeyboardKey_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 3) {

        }
        
    }
}
