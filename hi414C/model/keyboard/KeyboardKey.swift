//
//  KeyboardKey.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 26.03.2021.
//

struct KeyboardKey {
    var label: String
    var value: String
    
    init(_ label: String, value: String? = nil) {
        self.label = label
        self.value = value ?? label
    }
}
