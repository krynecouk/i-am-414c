//
//  ViewSettings.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 23.03.2021.
//

import SwiftUI

struct ViewSettings {
    var opacity: Double = 1
    var font: (name: FontName, size: CGFloat) = (.terminus, 13)
    var color: Color = Color("Primary")
}

struct ViewSettingsModifier: ViewModifier {
    let settings: ViewSettings
    
    func body(content: Content) -> some View {
        content
            .opacity(settings.opacity)
            .font(Font.custom(settings.font.name.rawValue, size: settings.font.size))
            .foregroundColor(settings.color)
    }
}

extension View {
    func withSettings(_ settings: ViewSettings) -> some View {
        self.modifier(ViewSettingsModifier(settings: settings))
    }
}