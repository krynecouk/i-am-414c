//
//  ColorButton.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.05.2021.
//

import SwiftUI

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
