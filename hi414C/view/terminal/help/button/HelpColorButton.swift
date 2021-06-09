//
//  ColorButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.05.2021.
//

import SwiftUI

struct HelpColorButton: View {
    @EnvironmentObject var themeVM: ThemeViewModel

    let name: String
    let sound: CustomSoundType?
    let theme: ThemeType
    
    init(_ name: String, sound: CustomSoundType? = .click, _ theme: ThemeType) {
        self.name = name
        self.sound = sound
        self.theme = theme
    }
    
    var body: some View {
        ColorButton(size: (70, 70), left: Color.primary(name), right: Color.secondary(name)) {
            if let sound = self.sound {
                CustomSound.play(sound)
            }
            themeVM.change(to: theme)
        }
        .border(Color.tertiary(name), width: 15)
        .padding(5)
        .border(themeVM.theme.type == theme ? Color.primary(name) : Color.clear, width: 5)
    }
}

struct ColorButton: View {
    var size: Size = (52, 52)
    var left: Color = .clear
    var right: Color = .clear
    var action: () -> Void
    
    init(size: Size = (50, 50), left: Color = .clear, right: Color = .clear, perform action: @escaping () -> Void = {}) {
        self.size = size
        self.left = left
        self.right = right
        self.action = action
    }
    
    var body: some View {
        Button(action: self.action) {
            DiagonalRectangle(size: size, left: left, right: right)
        }
    }
}

struct DiagonalRectangle: View {
    var size: Size = (100, 100)
    var left: Color = .clear
    var right: Color = .clear
    
    var body: some View {
        HStack(spacing: 0) {
            TriangleShape()
                .fill(left)
                .frame(width: size.width, height: size.height)
            TriangleShape()
                .fill(right)
                .rotationEffect(.degrees(180))
                .frame(width: size.width, height: size.height)
                .offset(x: -size.width)
        }
        .frame(width: size.width, height: size.height, alignment: .leading)
    }
}

struct DiagonalRectangle_Previews: PreviewProvider {
    static var previews: some View {
        DiagonalRectangle()
            .withEnvironment()
    }
}

struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.closeSubpath()
        
        return path
    }
}
