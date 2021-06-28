//
//  ASCIIArtLineView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 31.03.2021.
//

import SwiftUI

struct ASCIIArtLineView: View {
    var line: String
    var offset: LineOffset
    var visible: Bool
    var bloom: (speed: Double, color: Color)
    var shadow: Bool
    var theme: ViewTheme
    
    init(_ line: String, theme: ViewTheme = ViewTheme(), visible: Bool = false, bloom: (speed: Double, color: Color), offset: LineOffset = (0,0), shadow: Bool = false) {
        self.line = line
        self.theme = theme
        self.offset = offset
        self.visible = visible
        self.bloom = bloom
        self.shadow = shadow
    }
    
    var body: some View {
        if visible && bloom.speed > 0 {
            Line()
                .fadeOut(speed: bloom.speed, color: bloom.color)
        } else {
            Line()
        }
    }
    
    func Line() -> some View {
        ZStack {
            if shadow {
                Text(line)
                    .fixedSize()
                    .opacity(visible ? 0.3 : 0)
                    .offset(x: CGFloat(offset.x), y: CGFloat(offset.y))
                    .id(visible)
                    .withTheme(theme)
                    .offset(x: 5, y: 5)
            }
            Text(line)
                .fixedSize()
                .lineSpacing(0)
                .opacity(visible ? 1 : 0)
                .offset(x: CGFloat(offset.x), y: CGFloat(offset.y))
                .id(visible)
                .withTheme(theme)
        }
    }
}
