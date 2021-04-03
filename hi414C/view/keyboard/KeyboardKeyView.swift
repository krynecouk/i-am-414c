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
    var symbol: ASCIISymbol?
    var onClick: (String) -> Void
    var width: CGFloat
    var height: CGFloat
    var background: Color
    let font = Font.custom(FontName.proggyTiny.rawValue, size: 35)
    
    init(_ symbol: ASCIISymbol, value: String? = .none, width: CGFloat, height: CGFloat, background: Color = Color("Primary"), onClick: @escaping (String) -> Void = { _ in }) {
        self.init(symbol.rawValue, value: value, symbol: symbol, width: width, height: height, background: background, onClick: onClick)
    }
    
    init(_ label: String, value: String? = .none, symbol: ASCIISymbol? = .none, width: CGFloat, height: CGFloat, background: Color = Color("Primary"), onClick: @escaping (String) -> Void = { _ in }) {
        self.label = label
        self.value = value ?? label
        self.symbol = symbol
        self.width = width
        self.height = height
        self.background = background
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
            .fill(background)
            .frame(width: self.width, height: self.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onLongPressGesture(minimumDuration: 0) {
                onClick(value)
            }
    }
    
    func KeyboardKeyLabel() -> some View {
        Group {
            if symbol != .none {
                FigletKeyView(label, symbol: self.symbol, fontSize: label.count == 1 ? 5 : 4)
            } else if label.count > 1 && self.width < 50 {
                VStack(spacing: 4) {
                    let offsetMargin = self.width / 5
                    let offsets = label.count == 2
                        ? [-1 * offsetMargin, offsetMargin]
                        : [-1 * offsetMargin, 0, offsetMargin]
                    let fontSize: CGFloat = label.count == 2 ? 3.5 : 2.5
                    ForEach(Array(label.enumerated()), id: \.offset) { i, char in
                        Text(String(char)).foregroundColor(Color.black)
                            .offset(x: offsets[i])
                            .font(font)
                         
                        //FigletKeyView(String(char), symbol: self.symbol, fontSize: fontSize, offset: offsets[i])
                    }
                }
            } else {
                HStack {
                    Text(label).foregroundColor(Color.black)
                        .font(font)
                    // FigletKeyView(label, symbol: self.symbol, fontSize: label.count == 1 ? 5 : 4)
                }
            }
        }
    }
    
    func FigletKeyView(_ label: String, symbol: ASCIISymbol? = .none, fontSize: CGFloat, offset: CGFloat = 0) -> some View {
        let settings = FigletSettings(
            view: ViewSettings(
                font: (.terminus, fontSize),
                color: Color.black
            ),
            animations: []
        )
        
        return symbol != .none
            ? LiteFigletView(symbol!, settings: settings).offset(x: offset)
            : LiteFigletView(label, settings: settings).offset(x: offset)
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
