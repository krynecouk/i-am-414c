//
//  ViewTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.03.2021.
//

import SwiftUI

struct ViewTheme {
    var opacity: Double = 1
    var font: (name: FontName, size: CGFloat) = (.terminus, 13)
    var color: Color = .primary
    var background: Color?
}

struct ViewThemeModifier: ViewModifier {
    let theme: ViewTheme
    
    func body(content: Content) -> some View {
        content
            .opacity(theme.opacity)
            .font(Font.custom(theme.font.name.rawValue, size: theme.font.size))
            .foregroundColor(theme.color)
            .background(theme.background)
    }
}

extension View {
    func withTheme(_ theme: ViewTheme) -> some View {
        self.modifier(ViewThemeModifier(theme: theme))
    }
}
