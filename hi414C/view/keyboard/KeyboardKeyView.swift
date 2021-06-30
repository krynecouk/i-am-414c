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
    var width: CGFloat
    var height: CGFloat
    var theme: ViewTheme
    var collapsable: Bool
    var sound: SoundType?
    var onClick: (String) -> Void
    
    init(
        _ label: String,
        value: String? = .none,
        symbol: ASCIISymbol? = .none,
        width: CGFloat,
        height: CGFloat,
        theme: ViewTheme,
        collapsable: Bool = true,
        sound: SoundType? = .click,
        onClick: @escaping (String) -> Void = { _ in }) {
        
        self.label = label
        self.value = value ?? label
        self.width = width
        self.height = height
        self.theme = theme
        self.collapsable = collapsable
        self.sound = sound
        self.onClick = onClick
    }
    
    var body: some View {
        ZStack {
            KeyboardKeyBackground()
            KeyboardKeyLabel()
        }
    }
    
    func KeyboardKeyBackground() -> some View {
        Rectangle()
            .fill(theme.background ?? Color.white)
            .frame(width: self.width, height: self.height, alignment: .center)
            .onLongPressGesture(minimumDuration: 0) {
                if let sound = self.sound {
                    Sound.of(sound).play()
                }
                onClick(value)
            }
    }
    
    func KeyboardKeyLabel() -> some View {
        Group {
            if collapsable && label.count > 1 && self.width < 50 {
                VStack(spacing: 4) {
                    let offsetMargin = self.width / 6
                    let offsets = label.count == 2
                        ? [-1 * offsetMargin, offsetMargin]
                        : [-1 * offsetMargin, 0, offsetMargin]
                    ForEach(Array(label.enumerated()), id: \.offset) { i, char in
                        Text(String(char))
                            .offset(x: offsets[i])
                            .withTheme(theme)
                    }
                }
            } else {
                HStack {
                    Text(label)
                        .withTheme(theme)
                }
            }
        }
    }
}

struct KeyboardKey_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                PortraitKeyboardKeyPreview("Q")
                PortraitKeyboardKeyPreview("W")
                PortraitKeyboardKeyPreview("E")
                PortraitKeyboardKeyPreview("R")
                PortraitKeyboardKeyPreview("T")
                PortraitKeyboardKeyPreview("Y")
            }
            HStack(spacing: 4) {
                PortraitKeyboardKeyPreview("81")
                PortraitKeyboardKeyPreview("87")
                PortraitKeyboardKeyPreview("69")
                PortraitKeyboardKeyPreview("82")
                PortraitKeyboardKeyPreview("84")
                PortraitKeyboardKeyPreview("89")
                PortraitKeyboardKeyPreview("DEL")
            }
        }
    }
    
    static func PortraitKeyboardKeyPreview(_ label: String) -> some View {
        KeyboardKeyPreview(label)
    }
    
    static func LandscapeKeyboardKeyPreview(_ label: String) -> some View {
        KeyboardKeyPreview(label, width: 70, height: 40)
    }
    
    static func KeyboardKeyPreview(_ label: String, width: CGFloat = 40, height: CGFloat = 70) -> some View {
        KeyboardKeyView(label, width: width, height: height, theme: ViewTheme()) { _ in
            print("Clicked on \(label)")
        }
    }
}
