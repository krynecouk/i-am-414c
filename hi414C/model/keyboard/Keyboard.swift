//
//  Keyboard.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 26.03.2021.
//

typealias Keyboard = [KeyboardSide:KeyboardSet]

extension Keyboard {
    subscript(side: KeyboardSide) -> KeyboardSet {
        self[side]!
    }
}
