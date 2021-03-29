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
            if label.count > 1 && self.width < 50 {
                VStack(spacing: 4) {
                    let offsetMargin = self.width / 5
                    let offsets = label.count == 2
                        ? [-1 * offsetMargin, offsetMargin]
                        : [-1 * offsetMargin, 0, offsetMargin]
                    let fontSize: CGFloat = label.count == 2 ? 3.5 : 2.5
                    ForEach(Array(label.enumerated()), id: \.offset) { i, char in
                        FigletKeyView(String(char), fontSize: fontSize, offset: offsets[i])
                    }
                }
            } else {
                FigletKeyView(label, fontSize: label.count == 1 ? 5 : 4)
            }
        }
        .frame(width: self.width, height: self.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color("Primary"))
    }
    
    func FigletKeyView(_ label: String, fontSize: CGFloat, offset: CGFloat = 0) -> some View {
        FigletView(label, settings: FigletSettings(
            view: ViewSettings(
                font: (.terminus, fontSize),
                color: Color.black
            ),
            animations: [.shake(dt: 0.6, type: .rand)]
        ))
        .offset(x: offset)
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
        Landscape {
            VStack(spacing: 4) {
                HStack(spacing: 4) {
                    LandscapeKeyboardKeyPreview("Q")
                    LandscapeKeyboardKeyPreview("W")
                    LandscapeKeyboardKeyPreview("E")
                    LandscapeKeyboardKeyPreview("R")
                    LandscapeKeyboardKeyPreview("T")
                    LandscapeKeyboardKeyPreview("Y")
                }
                HStack(spacing: 4) {
                    LandscapeKeyboardKeyPreview("81")
                    LandscapeKeyboardKeyPreview("87")
                    LandscapeKeyboardKeyPreview("69")
                    LandscapeKeyboardKeyPreview("82")
                    LandscapeKeyboardKeyPreview("84")
                    LandscapeKeyboardKeyPreview("89")
                }
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
        KeyboardKeyView(label, width: width, height: height) { _ in
            print("Clicked on \(label)")
        }
    }
}
