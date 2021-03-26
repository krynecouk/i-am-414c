//
//  KeyboardSet.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 26.03.2021.
//

typealias KeyboardSet = [KeyboardPart:[KeyboardKey]]

extension KeyboardSet {
    subscript(part: KeyboardPart) -> [KeyboardKey] {
        self[part]!
    }
}
