//
//  ShakeNode.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 05.06.2021.
//

class ShakeNode: ThemeNode {
    convenience init(_ name: String, shake: ASCIIArtShakeType = .wave, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        self.init(name, shake: .shake(dt: 0.3, force: 3, type: shake, animation: .none), edges)
    }
    
    init(_ name: String, shake: ArtAnimation, @EdgeBuilder _ edges: () -> [Edge] = {[]}) {
        super.init(name, themer: { ShakeTheme(font: $0, color: $1, shake: shake) }, edges)
    }
}
