//
//  ViewTheme.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.03.2021.
//

import SwiftUI

struct ViewTheme {
    var opacity: Double = 1
    var font: FontProps = FontProps()
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

struct HiddenViewModifier: ViewModifier {
    let isHidden: Bool
    
    func body(content: Content) -> some View {
        if isHidden {
            content
                .hidden()
        } else {
            content
        }
    }
}

struct FontProps {
    var name: FontName
    var size: CGFloat
    
    init(_ name: FontName = .terminus, _ size: CGFloat = 13) {
        self.init(name: name, size: size)
    }
    
    init(name: FontName = .terminus, size: CGFloat = 13) {
        self.name = name
        self.size = size
    }
}

extension Font {
    static func create() -> Font {
        Font.of()
    }
    
    static func of(props: FontProps) -> Font {
        Font.of(name: props.name, size: props.size)
    }
    
    static func of(name: FontName = .terminus, size: CGFloat = 13) -> Font {
        Font.custom(name.rawValue, size: size)
    }
}

extension View {
    func withTheme(_ theme: ViewTheme) -> some View {
        self.modifier(ViewThemeModifier(theme: theme))
    }
}

extension View {
    func hidden(if condition: Bool = true) -> some View {
        self.modifier(HiddenViewModifier(isHidden: condition))
    }
}
