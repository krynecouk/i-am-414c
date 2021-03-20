//
//  FigletLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.03.2021.
//

import SwiftUI

struct FigletLine: View {
    var line: String
    var offset: CGFloat = 0
    var isVisible: Bool = false
    var color: Color = Color("Primary")
    var fontName: FontName = .terminus
    var fontSize: CGFloat = 13
    
    var body: some View {
        Text(line)
            .foregroundColor(color)
            .fixedSize()
            .multilineTextAlignment(.leading)
            .font(Font.custom(fontName.rawValue, size: fontSize)) // TODO param
            .opacity(isVisible ? 1 : 0)
            .offset(x: offset)
            .bloom(color: color)
    }
}

struct FigletLine_Previews: PreviewProvider {
    static var previews: some View {
        FigletLine(line: "██████", isVisible: true)
    }
}
